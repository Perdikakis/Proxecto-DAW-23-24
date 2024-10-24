<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('pedidos', function (Blueprint $table) {
            $table->id();
            $table->foreignId('usuario_id')->constrained('usuarios')->onDelete('cascade');
            $table->string('direccion', 255)->nullable();
            $table->dateTime('fecha_pedido')->nullable();
            $table->dateTime('fecha_envio')->nullable();
            $table->dateTime('fecha_finalizado')->nullable();
            $table->string('estado', 50)->nullable();
            $table->decimal('total', 10, 2);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('pedidos');
    }
};
