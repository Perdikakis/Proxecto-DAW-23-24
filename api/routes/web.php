<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers;
use Illuminate\Http\Request;

Route::get('/equipos', [Controllers\EquipoController::class, 'getEquipos']);

Route::get('/competiciones', [Controllers\CompeticionController::class, 'getCompeticiones']);

Route::get('/temporadas', [Controllers\CamisetaController::class, 'getTemporadas']);
Route::post('/camisetas', [Controllers\CamisetaController::class, 'getCamisetas']);

Route::get('/tallas', [Controllers\TallaController::class, 'getTallas']);








Route::post('/upload', function (Request $request) {
    $request->validate([
        'image' => 'required|image|mimes:jpeg,png,jpg,webp,svg|max:2048',
    ]);

    $imageName = time() . '.' . $request->image->extension();
    $request->image->move(public_path('images'), $imageName);

    return response()->json(['image' => $imageName]);
});