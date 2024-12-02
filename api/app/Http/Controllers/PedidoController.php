<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Camiseta;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class PedidoController extends Controller
{
    public function validarPedido(Request $request) {
        $msgErr = [
            'carrito.*.camiseta.id.required' => 'El ID de la camiseta es requerido en el producto :index',
            'carrito.*.camiseta.id.exists' => 'La camiseta con ID :input no existe en el producto :index',
            'carrito.*.nombre.regex' => 'El nombre en el producto :index debe tener entre 0 y 16 caracteres y solo contener letras',
            'carrito.*.dorsal.integer' => 'El dorsal en el producto :index debe ser un número entero',
            'carrito.*.dorsal.min' => 'El dorsal en el producto :index debe ser al menos 0',
            'carrito.*.dorsal.max' => 'El dorsal en el producto :index no puede ser mayor que 99',
            'carrito.*.talla.required' => 'La talla es requerida en el producto :index',
            'carrito.*.cantidad.required' => 'La cantidad es requerida en el producto :index',
            'carrito.*.cantidad.integer' => 'La cantidad en el producto :index debe ser un número entero',
            'carrito.*.cantidad.min' => 'La cantidad en el producto :index debe ser al menos 1',
        ];

        $validator = Validator::make($request->all(), [
            'carrito' => 'required|array',
            'carrito.*.camiseta.id' => 'required|exists:camisetas,id',
            'carrito.*.nombre' => 'nullable|regex:/^[\p{L}\s]{0,16}$/u',
            'carrito.*.dorsal' => 'nullable|integer|min:0|max:99',
            'carrito.*.talla' => 'required|string',
            'carrito.*.cantidad' => 'required|integer|min:1',
        ], $msgErr);

        if ($validator->fails()) {
            $errores = $validator->errors()->all();
            foreach ($errores as &$error) {
                preg_match('/carrito\.(\d+)\./', $error, $matches);
                if (isset($matches[1])) {
                    $index = $matches[1];
                    $error = str_replace(':index', $index + 1, $error);
                }
            }
            return response()->json(['success' => false, 'message' => implode("\n", $errores)]);
        }

        try {
            $carrito = $request->input('carrito');
            $precioTotal = 0;

            if(empty($carrito)) {
                return response()->json(['success' => false, 'message' => 'El carrito está vacío']);
            }

            // Agrupar cantidades por camiseta y talla
            $agrupado = [];
            foreach ($carrito as $item) {
                $key = $item['camiseta']['id'] . '-' . $item['talla'];
                if (!isset($agrupado[$key])) {
                    $agrupado[$key] = 0;
                }
                $agrupado[$key] += $item['cantidad'];
            }

            $errors = [];
            foreach ($carrito as $index => $item) {
                $camiseta = Camiseta::find($item['camiseta']['id']);
                if (!$camiseta) {
                    $errors[] = 'Camiseta no encontrada para ' . $item['camiseta']['equipo'] . ' ' . $item['camiseta']['nombre'] . ' ' . $item['camiseta']['temporada'];
                    continue;
                }

                $tallaDisponible = $camiseta->tallas()
                    ->where('talla', $item['talla'])
                    ->first();

                if (!$tallaDisponible) {
                    $tallasDisponibles = $camiseta->tallas()->pluck('talla')->implode(', ');
                    $errors[] = 'Talla no disponible para ' . $item['camiseta']['equipo'] . ' ' . $item['camiseta']['nombre'] . ' ' . $item['camiseta']['temporada'] . ' (Tallas disponibles: ' . $tallasDisponibles . ')';
                    continue;
                }

                $stock = DB::table('camiseta_talla')
                    ->where('camiseta_id', $camiseta->id)
                    ->where('talla_id', $tallaDisponible->id)
                    ->value('stock');

                $key = $item['camiseta']['id'] . '-' . $item['talla'];
                if ($stock < $agrupado[$key]) {
                    $errors[] = 'Stock insuficiente para ' . $item['camiseta']['equipo'] . ' ' . $item['camiseta']['nombre'] . ' ' . $item['camiseta']['temporada'] . ' (Stock disponible: ' . $stock . ')';
                }

                $precioTotal += $item['cantidad'] * $camiseta->precio;
            }

            if (!empty($errors)) {
                return response()->json(['success' => false, 'message' => implode("\n\n", $errors)]);
            }
    
            return response()->json(['success' => true, 'precioTotal' => $precioTotal]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Error del servidor']);
        }
    }

    public function realizarPedido(Request $request) {
        $validator = Validator::make($request->all(), [
            'data.carrito' => 'required|array',
            'data.direccion' => 'required|string',
            'data.poblacion' => 'required|string',
            'data.provincia' => 'required|string',
            'data.codigoPostal' => 'required|regex:/^[0-9]{5}$/',
            'data.telefono' => 'required|regex:/^[0-9]{9}$/',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()->first()]);
        }

        try {
            $data = $request->input('data');
            $carrito = $data['carrito'];

            $carritoFormateado = array_map(function($item) {
                return [
                    'camiseta' => $item['camiseta'],
                    'nombre' => $item['nombre'],
                    'dorsal' => $item['dorsal'],
                    'talla' => $item['talla'],
                    'cantidad' => $item['cantidad']
                ];
            }, $carrito);
        
            $response = $this->validarPedido(new Request(['carrito' => $carritoFormateado]));
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Error del servidor']);
        }

        if ($response->getData()->success){
            try {
                DB::beginTransaction();
                $data = $request->input('data');
                $carrito = $data['carrito'];
                $direccion = $data['direccion'];
                $poblacion = $data['poblacion'];
                $provincia = $data['provincia'];
                $codigoPostal = $data['codigoPostal'];
                $telefono = $data['telefono'];

                $direccionCompleta = "$direccion, $poblacion, $provincia, $codigoPostal, $telefono";
                $precioTotal = $response->getData()->precioTotal+3.20;

                $pedidoId = DB::table('pedidos')->insertGetId([
                    'usuario_id' => Auth::id(),
                    'direccion' => $direccionCompleta,
                    'fecha_pedido' => now(),
                    'fecha_envio' => now()->addDays(7),
                    'fecha_finalizado' => null,
                    'estado' => 'en proceso',
                    'total' => $precioTotal,
                ]);
                
                foreach ($carrito as $item) {
                    $camiseta = Camiseta::find($item['camiseta']['id']);
                    
                    $talla = $camiseta->tallas()
                        ->where('talla', $item['talla'])
                        ->first();

                    DB::table('pedido_camiseta_talla')->insert([
                        'pedido_id' => $pedidoId,
                        'camiseta_id' => $camiseta->id,
                        'talla_id' => $talla->id,
                        'nombre_camiseta' => $item['nombre'],
                        'dorsal' => $item['dorsal'],
                        'cantidad' => $item['cantidad']
                    ]);

                    DB::table('camiseta_talla')
                        ->where('camiseta_id', $camiseta->id)
                        ->where('talla_id', $talla->id)
                        ->decrement('stock', $item['cantidad']);

                    DB::table('camiseta_talla')
                        ->where('camiseta_id', $camiseta->id)
                        ->where('talla_id', $talla->id)
                        ->increment('ventas', $item['cantidad']);    
                }

                DB::commit();
                return response()->json(['success' => true, 'message' => 'Pedido realizado con éxito']);
            } catch (\Exception $e) {
                Log::error($e->getMessage());
                DB::rollBack();
                return response()->json(['success' => false, 'message' => 'Error del servidor']);
            }
        } else {
            return response()->json(['success' => false, 'message' => $response->getData()->message]);
        }
    }
}