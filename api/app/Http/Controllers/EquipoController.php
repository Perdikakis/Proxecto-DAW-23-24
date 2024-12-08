<?php

namespace App\Http\Controllers;

use App\Models\Equipo;

class EquipoController extends Controller
{
    public function getEquipos(){
        $equipos = Equipo::with(['competiciones:id', 'imagen'])->get();

        $equipos = $equipos->map(function($equipo) {
            return [
                'id' => $equipo->id,
                'nombre' => $equipo->nombre,
                'competiciones' => $equipo->competiciones->pluck('id'),
                'imagen' => $equipo->imagen ? env('APP_URL') . $equipo->imagen->ruta : ''
            ];
        });
        
        return response()->json($equipos);
    }
}
