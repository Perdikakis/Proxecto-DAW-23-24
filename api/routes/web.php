<?php

use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;

Route::middleware([EnsureFrontendRequestsAreStateful::class, 'auth:sanctum'])->group(function () {
    Route::post('/logout', [Controllers\AuthController::class, 'logout']);

    Route::post('/upload', [Controllers\ImagenController::class, 'upload']);

    Route::get('/user', [Controllers\UsuarioController::class, 'getUser']);
    Route::put('/updateUser', [Controllers\UsuarioController::class, 'updateUser']);
    Route::delete('/deleteUser', [Controllers\UsuarioController::class, 'deteleUser']);

    Route::post('/validarPedido', [Controllers\PedidoController::class, 'validarPedido']);
    Route::post('/realizarPedido', [Controllers\PedidoController::class, 'realizarPedido']);
    Route::get('/pedidos', [Controllers\PedidoController::class, 'getPedidos']);
    Route::get('/getDetallesPedido/{id}', [Controllers\PedidoController::class, 'getDetallesPedido']);
});

Route::post('/login', [Controllers\AuthController::class, 'login']);
Route::post('/signin', [Controllers\AuthController::class, 'signin']);

Route::get('/temporadas', [Controllers\CamisetaController::class, 'getTemporadas']);
Route::post('/camisetasFiltradas', [Controllers\CamisetaController::class, 'getCamisetasFiltradas']);
Route::post('/top-ventas', [Controllers\CamisetaController::class, 'topVentas']);

Route::get('/competiciones', [Controllers\CompeticionController::class, 'getCompeticiones']);

Route::get('/equipos', [Controllers\EquipoController::class, 'getEquipos']);

Route::get('/tallasCamiseta/{id}', [Controllers\TallaController::class, 'getTallas']);

Route::get('/images/{filename}', function ($filename) {
    $path = public_path('img/users/' . $filename);

    if (!File::exists($path)) {
        abort(404);
    }

    $file = File::get($path);
    $type = File::mimeType($path);

    $response = Response::make($file, 200);
    $response->header("Content-Type", $type);

    return $response;
});