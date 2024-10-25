<?php

namespace App\Http\Controllers;

use App\Models\Equipo;
use Illuminate\Http\Request;

class EquipoController extends Controller
{
    public function getEscudo(){
        $equipo = Equipo::where('nombre', 'FC Barcelona')->first();
        $imagenes = $equipo->images()->pluck('ruta');
        return response()->json([
            'equipo_id' => $equipo->id,
            'imagenes' => $imagenes
        ]);
    }
}
