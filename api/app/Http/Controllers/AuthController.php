<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\Usuario;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    public function login(Request $request) {
        $validator = Validator::make($request->all(), [
            'usuario' => 'required|string',
            'password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $usuario = Usuario::where('usuario', $request->input('usuario'))->first();

            if ($usuario && Hash::check($request->input('password'), $usuario->password)) {
                $usuario->update(['fecha_ultimo_acceso' => now()]);
                $usuario->tokens()->delete();

                $token = $usuario->createToken('authToken')->plainTextToken;

                return response()->json([
                    'success' => true,
                    'token' => $token
                ]);
            }

            return response()->json([
                'success' => false,
            ], 401);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function signin(Request $request) {
        $validator = Validator::make($request->all(), [
            'usuario' => 'required|string|unique:usuarios',
            'password' => 'required|string',
            'correo' => 'required|string|unique:usuarios',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 422);
        }

        try {
            $usuario = Usuario::create([
                'usuario' => $request->input('usuario'),
                'password' => Hash::make($request->input('password')),
                'correo' => $request->input('correo'),
                'id_rol' => 1,
                'fecha_ultimo_acceso' => Carbon::now(),
            ]);

            $token = $usuario->createToken('authToken')->plainTextToken;
    
            return response()->json([
                'success' => true,
                'token' => $token,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
