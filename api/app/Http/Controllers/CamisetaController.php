<?php

namespace App\Http\Controllers;

use App\Models\Camiseta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;

class CamisetaController extends Controller {

    public function getTemporadas(){
        try {
            $yearMin = Camiseta::min('year_inicio');
            $yearMax = Camiseta::max('year_fin');
            $listaTemporadas = [];

            for ($year = $yearMin; $year <= $yearMax; $year++) {
                $nextYear = $year + 1;
                $listaTemporadas[] = "{$year}/{$nextYear}";
            }

            return response()->json(array_reverse($listaTemporadas));
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error al obtener las temporadas'], 500);
        }
    }

    public function getCamisetasFiltradas(Request $request){
        try {
            $validator = Validator::make($request->all(), [
                'camisetas_ids' => 'nullable|array',
                'camisetas_ids.*' => 'integer|exists:camisetas,id',
                'equipo_id' => 'nullable|integer|exists:equipos,id',
                'competicion_id' => 'nullable|integer|exists:competiciones,id',
                'temporada' => 'nullable|string|regex:/^\d{4}\/\d{4}$/',
            ]);

            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()], 400);
            }

            $camisetasIds = $request->input('camisetas_ids');
            $equipoId = $request->input('equipo_id');
            $competicionId = $request->input('competicion_id');
            $temporada = $request->input('temporada');
            
            $query = Camiseta::query();

            if($camisetasIds){
                $query->whereIn('id', $camisetasIds);
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

            $camisetas = $query->with('equipo:id,nombre', 'images')->get();

            $result = $camisetas->map(function($camiseta) {
                $yearInicio = substr($camiseta->year_inicio, -2);
                $yearFin = substr($camiseta->year_fin, -2);

                $imagenes = $camiseta->images->map(function($imagen) {
                    return env('APP_URL') . $imagen->ruta;
                });
                
                return [
                    'id' => $camiseta->id,
                    'estado' => $camiseta->estado,
                    'nombre' => $camiseta->version,
                    'equipo' => $camiseta->equipo->nombre,
                    'year_inicio' => $camiseta->year_inicio,
                    'year_fin' => $camiseta->year_fin,
                    'temporada' => "{$yearInicio}/{$yearFin}",
                    'precio' => $camiseta->precio,
                    'imagenes' => $imagenes ? $imagenes->toArray() : [],
                    'competiciones' => $camiseta->equipo->competiciones->pluck('id')->toArray()
                ];
            });

            return response()->json($result);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error al obtener las camisetas'], 500);
        }
    }

    public function topVentas(Request $request){
        try {
            $validator = Validator::make($request->all(), [
                'idCompeticion' => 'required|integer|exists:competiciones,id',
                'limit' => 'nullable|integer|min:1'
            ]);
    
            if ($validator->fails()) {
                return response()->json(['error' => $validator->errors()], 400);
            }
            
            $limit = $request->input('limit', 4);
            $idCompeticion = $request->input('idCompeticion');
    
            $camisetasIds = DB::table('camisetas')
                ->join('equipos', 'camisetas.equipo_id', '=', 'equipos.id')
                ->join('equipo_competicion', 'equipos.id', '=', 'equipo_competicion.equipo_id')
                ->join('competiciones', 'equipo_competicion.competicion_id', '=', 'competiciones.id')
                ->join('camiseta_talla', 'camisetas.id', '=', 'camiseta_talla.camiseta_id')
                ->select('camisetas.id', DB::raw('SUM(camiseta_talla.ventas) as total_ventas'))
                ->where('competiciones.id', $idCompeticion)
                ->groupBy('camisetas.id', 'camisetas.estado', 'camisetas.version', 'equipos.nombre', 'camisetas.year_inicio', 'camisetas.year_fin', 'camisetas.precio')
                ->orderBy('total_ventas', 'DESC')
                ->pluck('camisetas.id');
            
            $camisetasLimit = DB::table('camisetas')
                ->join('equipos', 'camisetas.equipo_id', '=', 'equipos.id')
                ->join('equipo_competicion', 'equipos.id', '=', 'equipo_competicion.equipo_id')
                ->join('competiciones', 'equipo_competicion.competicion_id', '=', 'competiciones.id')
                ->join('camiseta_talla', 'camisetas.id', '=', 'camiseta_talla.camiseta_id')
                ->select('camisetas.id as camiseta_id', 'camisetas.estado', 'camisetas.version as nombre', 'equipos.nombre as equipo_nombre', 'camisetas.year_inicio', 'camisetas.year_fin', 'camisetas.precio', DB::raw('SUM(camiseta_talla.ventas) as total_ventas'))
                ->where('competiciones.id', $idCompeticion)
                ->groupBy('camisetas.id', 'camisetas.estado', 'camisetas.version', 'equipos.nombre', 'camisetas.year_inicio', 'camisetas.year_fin', 'camisetas.precio')
                ->orderBy('total_ventas', 'DESC')
                ->limit($limit)
                ->get();
    
            $result = $camisetasLimit->map(function($camiseta) {
                $yearInicio = substr($camiseta->year_inicio, -2);
                $yearFin = substr($camiseta->year_fin, -2);
    
                $imagenes = DB::table('images')
                    ->where('imageable_type', 'App\\Models\\Camiseta')
                    ->where('imageable_id', $camiseta->camiseta_id)
                    ->pluck('ruta')
                    ->map(function($ruta) {
                        return env('APP_URL') . $ruta;
                    });
    
                return [
                    'id' => $camiseta->camiseta_id,
                    'estado' => $camiseta->estado,
                    'nombre' => $camiseta->nombre,
                    'equipo' => $camiseta->equipo_nombre,
                    'temporada' => "{$yearInicio}/{$yearFin}",
                    'precio' => $camiseta->precio,
                    'imagenes' => $imagenes ? $imagenes->toArray() : []
                ];
            });
    
            return response()->json(['camisetas' => $result, 'ids' => $camisetasIds]);
        } catch (\Exception $e) {
            return response()->json(['error' => 'error al obtener top ventas'], 500);
        }
    }

    public function editCamiseta(Request $request){
        $validator = Validator::make($request->all(), [
            'id' => 'nullable|integer|exists:camisetas,id',
            'equipo' => 'required|integer|exists:equipos,id',
            'year_inicio' => 'required|integer|min:1970|max:' . date('Y'),
            'year_fin' => 'required|integer|min:1970|max:' . date('Y'),
            'nombre' => 'required|string|max:255',
            'precio' => 'required|numeric|min:0',
            'estado' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        try {
            if ($request->input('id') !== null) {
                $camiseta = Camiseta::find($request->input('id'));

                if (!$camiseta) {
                    return response()->json(['error' => 'Camiseta no encontrada'], 404);
                }

                $camiseta->equipo_id = $request->input('equipo');
                $camiseta->year_inicio = $request->input('year_inicio');
                $camiseta->year_fin = $request->input('year_fin');
                $camiseta->version = $request->input('nombre');
                $camiseta->precio = number_format((float)$request->input('precio'), 2, '.', '');
                $camiseta->estado = $request->input('estado');
                $camiseta->save();

                return response()->json(['message' => 'Camiseta editada correctamente', 'camiseta' => $camiseta]);
            } else {
                $camiseta = new Camiseta();
                $camiseta->equipo_id = $request->input('equipo');
                $camiseta->year_inicio = $request->input('year_inicio');
                $camiseta->year_fin = $request->input('year_fin');
                $camiseta->version = $request->input('nombre');
                $camiseta->precio = number_format((float)$request->input('precio'), 2, '.', '');
                $camiseta->estado = $request->input('estado');
                $camiseta->save();

                return response()->json(['id' => $camiseta->id, 'message' => 'Camiseta creada correctamente']);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error al editar la camiseta'], 500);
        }
    }

    public function deleteCamisetas(Request $request){
        $validator = Validator::make($request->all(), [
            'ids' => 'required|array',
            'ids.*' => 'integer|exists:camisetas,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        try {
            DB::beginTransaction();
            $ids = $request->input('ids');
            $camisetas = Camiseta::with('images')->whereIn('id', $ids)->get();
            
            foreach ($camisetas as $camiseta) {
                foreach ($camiseta->images as $imagen) {
                    $filePath = public_path($imagen->ruta);
                    if (File::exists($filePath)) {
                        File::delete($filePath);
                    }
                $imagen->delete();
                }
            }
            
            Camiseta::destroy($ids);
            DB::commit();
            return response()->json(['message' => 'Camisetas eliminadas correctamente']);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => 'Error al eliminar las camisetas']);
        }
    }
}
