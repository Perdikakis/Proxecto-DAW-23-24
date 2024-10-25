<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\Usuario;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    public function login(Request $request)
    {
        // Validar las credenciales
        $validator = Validator::make($request->all(), [
            'usuario' => 'required|string', // Validación de usuario: requerido y debe ser un string
            'password' => 'required|string', // Validación de contraseña: requerido y debe ser un string
        ]);

        // Comprobar si la validación falla
        if ($validator->fails()) {
            return response()->json([
                'errors' => $validator->errors(),
            ], 422); // Retornar errores de validación
        }

        // Buscar el usuario en la base de datos
        $usuario = Usuario::where('usuario', $request->input('usuario'))->first();

        // Comprobar si el usuario existe y la contraseña es correcta
        if ($usuario && password_verify($request->input('password'), $usuario->password)) {
            // Autenticación exitosa
            $usuario->fecha_ultimo_acceso = Carbon::now()->format('Y-m-d H:i:s'); // Guardar en el formato deseado
            $usuario->save();
            $usuario->tokens()->delete();
            $token = $usuario->createToken('authToken')->plainTextToken;
            return response()->json([
                'message' => 'Login exitoso',
                'usuario' => $token,
            ]);
        }

        // Si la autenticación falla
        return response()->json([
            'message' => 'Credenciales inválidas',
        ], 401); // Retornar error de autenticación
    }
}
