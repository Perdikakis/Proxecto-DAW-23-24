<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('images', function (Blueprint $table) {
            $table->id();
            $table->string('imageable_type');
            $table->integer('imageable_id');
            $table->string('ruta', 255);
            $table->string('nombre_archivo', 255);
            $table->string('tipo_mime', 100);
        });
    }

    public function down()
    {
        Schema::dropIfExists('images');
    }
};
