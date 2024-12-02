<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('usuarios', function (Blueprint $table) {
            $table->id();
            $table->string('usuario', 100);
            $table->string('password', 255);
            $table->string('correo', 100);
            $table->string('nombre', 100)->nullable();
            $table->string('apellidos', 100)->nullable();
            $table->string('direccion', 255)->nullable();
            $table->string('telefono', 15)->nullable();
            $table->unsignedBigInteger('rol_id', 50);
            $table->dateTime('fecha_alta')->nullable();
            $table->dateTime('fecha_ultimo_acceso')->nullable();

            $table->foreign('rol_id')->references('id')->on('roles')->onDelete('set null');
        });
    }

    public function down()
    {
        Schema::dropIfExists('usuarios');
    }
};
