<?php

namespace App\Http\Controllers;

use App\Models\Competicion;
use Illuminate\Http\Request;

class CompeticionController extends Controller
{
    public function getCompeticiones(){
        $competiciones = Competicion::with('imagen')->select('id', 'nombre')->get();

        $competiciones = $competiciones->map(function ($competicion) {
            return [
                'id' => $competicion->id,
                'nombre' => $competicion->nombre,
                'imagen' => $competicion->imagen ? env('APP_URL') . $competicion->imagen->ruta : '',
            ];
        });

        return response()->json($competiciones);
    }
}
