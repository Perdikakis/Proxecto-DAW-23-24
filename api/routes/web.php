<?php

use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers;

Route::middleware([EnsureFrontendRequestsAreStateful::class, 'auth:sanctum'])->group(function () {
    Route::post('/logout', [Controllers\AuthController::class, 'logout']);

    Route::get('/user', [Controllers\UsuarioController::class, 'getUsuario']);
    Route::post('/updateUser', [Controllers\UsuarioController::class, 'updateUsuario']);

    Route::post('/validarPedido', [Controllers\PedidoController::class, 'validarPedido']);
    Route::post('/realizarPedido', [Controllers\PedidoController::class, 'realizarPedido']);
    Route::get('/pedidos', [Controllers\PedidoController::class, 'getPedidos']);
});

Route::post('/login', [Controllers\AuthController::class, 'login']);
Route::post('/signin', [Controllers\AuthController::class, 'signin']);

Route::get('/temporadas', [Controllers\CamisetaController::class, 'getTemporadas']);
Route::post('/camisetasFiltradas', [Controllers\CamisetaController::class, 'getCamisetasFiltradas']);
Route::post('/top-ventas', [Controllers\CamisetaController::class, 'topVentas']);

Route::get('/competiciones', [Controllers\CompeticionController::class, 'getCompeticiones']);

Route::get('/equipos', [Controllers\EquipoController::class, 'getEquipos']);

Route::get('/tallasCamiseta/{id}', [Controllers\TallaController::class, 'getTallas']);








/*Route::post('/upload', function (Request $request) {
    $request->validate([
        'image' => 'required|image|mimes:jpeg,png,jpg,webp,svg|max:2048',
    ]);

    $imageName = time() . '.' . $request->image->extension();
    $request->image->move(public_path('images'), $imageName);

    return response()->json(['image' => $imageName]);
});*/