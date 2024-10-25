<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers;
use Illuminate\Http\Request;

Route::get('pedidos/{pedido}/camisetas', [Controllers\PedidoController::class, 'getCamisetas']);

Route::post('/login', [Controllers\AuthController::class, 'login']);