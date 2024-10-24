<?php

namespace App\Http\Controllers;

use App\Models\Pedido;
use Illuminate\Http\JsonResponse;

class PedidoController extends Controller
{
    /*public function getCamisetas($pedidoId): JsonResponse
    {
        // Obtener el pedido junto con las camisetas y tallas
        $pedido = Pedido::with(['camisetas' => function ($query) {
            $query->with('tallas');
        }])->findOrFail($pedidoId);

        // Formatear los datos
        $camisetas = $pedido->camisetas->map(function ($camiseta) {
            return [
                'camiseta_id' => $camiseta->id,
                'version' => $camiseta->version,
                'precio' => $camiseta->precio,
                'tallas' => $camiseta->tallas->map(function ($talla) {
                    return [
                        'talla_id' => $talla->id,
                        'talla' => $talla->talla,
                    ];
                }),
                'cantidad' => $camiseta->pivot->cantidad,
                'dorsal' => $camiseta->pivot->dorsal,
                'nombre' => $camiseta->pivot->nombre,
            ];
        });

        return response()->json($pedido);
    }*/
}
