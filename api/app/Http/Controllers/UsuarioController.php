<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UsuarioController extends Controller
{
    public function getUsuario(Request $request)
    {
        return response()->json($request->user());
    }
}

