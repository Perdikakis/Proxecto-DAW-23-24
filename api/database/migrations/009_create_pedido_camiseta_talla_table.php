<?php

namespace Database\Migrations;

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('pedido_camiseta_talla', function (Blueprint $table) {
            $table->id();
            $table->foreignId('pedido_id')->constrained('pedidos')->onDelete('cascade');
            $table->foreignId('camiseta_id')->constrained('camisetas')->onDelete('cascade');
            $table->foreignId('talla_id')->constrained('tallas')->onDelete('cascade');
            $table->integer('cantidad');
            $table->string('nombre_camiseta', 16)->nullable();
            $table->integer('dorsal')->nullable();
        });
    }

    public function down()
    {
        Schema::dropIfExists('pedido_camiseta_talla');
    }
};
