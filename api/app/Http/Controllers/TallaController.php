<?php

namespace App\Http\Controllers;

use App\Models\Talla;
use Illuminate\Http\Request;

class TallaController extends Controller
{
    public function getTallas($id) {
        try {
            $tallas = Talla::whereHas('camisetas', function($query) use ($id) {
                $query->where('camiseta_id', $id);
            })->with(['camisetas' => function($query) use ($id) {
                $query->where('camiseta_id', $id);
            }])->get();
    
            $formattedTallas = $tallas->map(function($talla) {
                $camiseta = $talla->camisetas->first();
                return [
                    'talla' => $talla->talla,
                    'medidas' => $talla->medidas,
                    'stock' => $camiseta->pivot->stock,
                    'ventas' => $camiseta->pivot->ventas,
                ];
            });
    
            return response()->json($formattedTallas);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error al obtener las tallas'], 500);
        }
    }
}
