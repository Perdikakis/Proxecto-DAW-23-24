<?php

namespace App\Http\Controllers;

use App\Models\Talla;
use Illuminate\Http\Request;

class TallaController extends Controller
{
    public function getTallas() {
        $tallas = Talla::all();

        $formattedTallas = $tallas->map(function($talla) {
            return [
                'talla' => $talla->talla,
                'medidas' => $talla->medidas,
            ];
        });

        return response()->json($formattedTallas);
    }
}
