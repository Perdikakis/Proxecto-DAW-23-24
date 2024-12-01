<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Camiseta;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

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
            'carrito.*.camiseta.id' => 'required|exists:camisetas,id',
            'carrito.*.nombre' => 'nullable|regex:/^[\p{L}]{0,16}$/u',
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
}