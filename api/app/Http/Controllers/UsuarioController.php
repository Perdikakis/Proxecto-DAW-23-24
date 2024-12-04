<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class UsuarioController extends Controller
{
    public function getUsuario(Request $request) {
        $user = $request->user();
        return response()->json($user);
    }

    public function updateUsuario(Request $request) {
        try {
            $user = $request->user();
            Log::info('Datos del usuario antes de la actualización: ' . json_encode($user));

            $validator = Validator::make($request->all(), [
                'correo' => 'nullable|email|unique:usuarios,correo,' . $user->id,
                'usuario' => 'nullable|string|min:6|unique:usuarios,usuario,' . $user->id,
                'nombre' => 'nullable|string|max:255',
                'apellidos' => 'nullable|string|max:255',
                'telefono' => 'nullable|digits:9',
                'direccion' => 'nullable|string|max:255',
            ]);

            if ($validator->fails()) {
                Log::error('Error de validación: ' . json_encode($validator->errors()));
                return response()->json(['message' => 'Datos inválidos', 'errors' => $validator->errors()], 422);
            }

            $validatedData = $validator->validated();
            Log::info('Datos validados: ' . json_encode($validatedData));

            $user->update($validatedData);
            
            return $this->getUsuario($request);
        } catch (\Exception $e) {
            Log::error('Error al actualizar usuario: ' . $e->getMessage());
            return response()->json(['message' => 'Error al actualizar usuario', 'error' => $e->getMessage()], 500);
        }
    }

}