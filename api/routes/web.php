<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers;

Route::get('pedidos/{pedido}/camisetas', [Controllers\PedidoController::class, 'getCamisetas']);