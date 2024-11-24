<?php

namespace App\Http\Controllers;

use App\Models\Camiseta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CamisetaController extends Controller
{
    public function getTemporadas(){
        $yearMin = Camiseta::min('year_inicio');
        $yearMax = Camiseta::max('year_fin');
        $listaTemporadas = [];

        for ($year = $yearMin; $year <= $yearMax; $year++) {
            $nextYear = $year + 1;
            $listaTemporadas[] = "{$year}/{$nextYear}";
        }

        return response()->json($listaTemporadas);
    }

    public function getCamisetas(Request $request){
        $camisetaId = $request->input('camiseta_id');
        $equipoId = $request->input('equipo_id');
        $competicionId = $request->input('competicion_id');
        $temporada = $request->input('temporada');
        
        $query = Camiseta::query();

        if($camisetaId){
            $query->where('id', $camisetaId);
        }

        if ($equipoId) {
            $query->where('equipo_id', $equipoId);
        }

        if ($competicionId) {
            $query->whereHas('equipo.competiciones', function($q) use ($competicionId) {
                $q->where('competicion_id', $competicionId);
            });
        }

        if ($temporada) {
            list($yearInicio, $yearFin) = explode('/', $temporada);
            $query->where('year_inicio', $yearInicio)
                  ->where('year_fin', $yearFin);
        }

        $camisetas = $query->with('equipo:id,nombre')->get();

        $result = $camisetas->map(function($camiseta) {
            $yearInicio = substr($camiseta->year_inicio, -2);
            $yearFin = substr($camiseta->year_fin, -2);

            $imagenes = DB::table('images')
                ->where('imageable_type', 'App\\Models\\Camiseta')
                ->where('imageable_id', $camiseta->id)
                ->pluck('ruta');

            return [
                'id' => $camiseta->id,
                'estado' => $camiseta->estado,
                'nombre' => $camiseta->version,
                'equipo' => $camiseta->equipo->nombre,
                'temporada' => "{$yearInicio}/{$yearFin}",
                'imagenes' => $imagenes ? $imagenes->toArray() : [],
            ];
        });

        return response()->json($result);
    }
}
