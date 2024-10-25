<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers;
use Illuminate\Http\Request;

Route::get('pedidos/{pedido}/camisetas', [Controllers\PedidoController::class, 'getCamisetas']);

Route::post('/login', [Controllers\AuthController::class, 'login']);

Route::get('/barsa', [Controllers\EquipoController::class, 'getEscudo']);

Route::post('/upload', function (Request $request) {
    $request->validate([
        'image' => 'required|image|mimes:jpeg,png,jpg,webp,svg|max:2048',
    ]);

    $imageName = time() . '.' . $request->image->extension();
    $request->image->move(public_path('images'), $imageName);

    return response()->json(['image' => $imageName]);
});