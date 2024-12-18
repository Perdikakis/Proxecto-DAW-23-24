<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\Usuario;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
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

                $usuario->image = $usuario->imagen ? env('APP_URL') . $usuario->imagen->ruta : '';

                return response()->json([
                    'success' => true,
                    'user' => $usuario,
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
            'usuario' => 'required|string|regex:/^[a-zA-Z0-9_-]{6,16}$/|unique:usuarios',
            'password' => 'required|string|min:6|max:64',
            'correo' => 'required|string|email|unique:usuarios',
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            $customMessages = [];
            
            if ($errors->has('usuario')) {
                $customMessages['usuario'] = 'El nombre de usuario ya existe.';
            }

            if ($errors->has('correo')) {
                $customMessages['correo'] = 'El correo electrónico ya existe.';
            }

            return response()->json([
                'errors' => $customMessages,
            ], 422);
        }

        try {
            $usuario = Usuario::create([
                'usuario' => $request->input('usuario'),
                'password' => Hash::make($request->input('password')),
                'correo' => $request->input('correo'),
                'rol_id' => 2,
                'fecha_alta' => Carbon::now(),
                'fecha_ultimo_acceso' => Carbon::now(),
            ]);

            $token = $usuario->createToken('authToken')->plainTextToken;
 
            $usuario->image = $usuario->imagen ? env('APP_URL') . $usuario->imagen->ruta : '';

            return response()->json([
                'success' => true,
                'token' => $token,
                'user' => $usuario,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function logout(Request $request) {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Cierre de sesión exitoso']);
    }
}
