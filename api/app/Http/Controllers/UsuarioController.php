<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class UsuarioController extends Controller
{
    public function getUser() {
        $user = Auth::user();
        $user->image = $user->imagen ? env('APP_URL') . $user->imagen->ruta : '';
        return response()->json(['user' => $user]);
    }

    public function updateUser(Request $request) {
        try {
            $user = $request->user();

            $validator = Validator::make($request->all(), [
                'correo' => 'required|email|unique:usuarios,correo,' . $user->id,
                'usuario' => 'required|string|min:6|unique:usuarios,usuario,' . $user->id,
                'nombre' => 'nullable|string|max:255',
                'apellidos' => 'nullable|string|max:255',
                'telefono' => 'nullable|digits:9',
                'direccion' => 'nullable|string|max:255',
            ]);

            if ($validator->fails()) {
                return response()->json(['message' => 'Datos invalidos', 'errors' => $validator->errors()], 422);
            }

            $validatedData = $validator->validated();

            $user->update($validatedData);

            $user->image = $user->imagen ? env('APP_URL') . $user->imagen->ruta : '';
            return response()->json(['user' => $user]);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error al actualizar usuario', 'error' => $e->getMessage()], 500);
        }
    }

    public function deteleUser(Request $request) {
        try {
            $user = $request->user();
            $user->tokens()->delete();
            $user->delete();
            return response()->json(['message' => 'Usuario eliminado correctamente'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error al eliminar usuario', 'error' => $e->getMessage()], 500);
        }
    }
}