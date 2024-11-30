<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\Usuario;
use Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'usuario' => 'required|string',
            'password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 422);
        }

        $usuario = Usuario::where('usuario', $request->input('usuario'))->first();

        if ($usuario && Hash::check($request->input('password'), $usuario->password)) {
            $usuario->update(['fecha_ultimo_acceso' => now()]);
            $usuario->tokens()->delete();

            $token = $usuario->createToken('authToken')->plainTextToken;

            return response()->json([
                'message' => 'Login exitoso',
                'token' => $token,
            ]);
        }

        return response()->json([
            'message' => 'Credenciales inválidas',
        ], 401);
    }
}
