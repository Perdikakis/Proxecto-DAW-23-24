<?php

namespace App\Http\Controllers;

use App\Models\Equipo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class EquipoController extends Controller
{
    /*public function getEscudo(){
        $equipo = Equipo::where('nombre', 'FC Barcelona')->first();
        $imagenes = $equipo->images()->pluck('ruta');
        return response()->json([
            'equipo_id' => $equipo->id,
            'imagenes' => $imagenes
        ]);
    }*/

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
