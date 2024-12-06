<?php

namespace App\Http\Controllers;

use App\Models\Imagen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class ImagenController extends Controller
{
    public function upload(Request $request) {
        try {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,webp,svg|max:2048',
            ]);
    
            $imageName = time() . '.' . $request->image->extension();
            $request->image->move(public_path('images/users'), $imageName);

            $image = Imagen::create([
                'imageable_type' => 'App\Models\Usuario',
                'imageable_id' => Auth::id(),
                'ruta' => 'images/' . $imageName,
                'nombre_archivo' => $imageName,
                'tipo_mime' => $request->image->getClientMimeType(),
            ]);

            $imageUrl = url('images/' . $imageName);
    
            return response()->json(['image' => $imageUrl]);
        } catch (\Exception $e) {
            Log::info($e->getMessage());
            return response()->json([
                'success' => false,
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
