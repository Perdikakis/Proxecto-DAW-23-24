<?php

namespace App\Http\Controllers;

use App\Models\Equipo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class EquipoController extends Controller
{
    public function getEquipos(){
        $equipos = Equipo::with('competiciones:id')->get();
        $equipos = $equipos->map(function($equipo) {
            return [
                'id' => $equipo->id,
                'nombre' => $equipo->nombre,
                'competiciones' => $equipo->competiciones->pluck('id')
            ];
        });
        return response()->json($equipos);
    }
}
