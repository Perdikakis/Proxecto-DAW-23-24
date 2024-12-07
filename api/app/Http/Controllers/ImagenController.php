<?php

namespace App\Http\Controllers;

use App\Models\Imagen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;

class ImagenController extends Controller
{
    public function upload(Request $request) {
        try {
            $request->validate([
                'image' => 'required|image|mimes:jpeg,png,jpg,webp,svg|max:2048',
            ]);
    
            $userId = Auth::id();
            $existingImage = Imagen::where('imageable_type', 'App\Models\Usuario')
                ->where('imageable_id', $userId)
                ->first();

            if ($existingImage) {
                $existingImagePath = public_path($existingImage->ruta);
                if (File::exists($existingImagePath)) {
                    File::delete($existingImagePath);
                }

                $existingImage->delete();
            }

            $imageName = time() . '.' . $request->image->extension();
            $request->image->move(public_path('images/users'), $imageName);

            $image = Imagen::create([
                'imageable_type' => 'App\Models\Usuario',
                'imageable_id' => $userId,
                'ruta' => 'images/users/' . $imageName,
                'nombre_archivo' => $imageName,
                'tipo_mime' => $request->image->getClientMimeType(),
            ]);

            $imageUrl = url('images/' . $image->ruta);
    
            return response()->json(['image' => $imageUrl]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
