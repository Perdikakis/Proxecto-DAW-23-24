<?php

namespace App\Http\Controllers;

use App\Models\Competicion;
use Illuminate\Http\Request;

class CompeticionController extends Controller
{
    public function getCompeticiones(){
        $competiciones = Competicion::select('id', 'nombre')->get();
        return response()->json($competiciones);
    }
}
