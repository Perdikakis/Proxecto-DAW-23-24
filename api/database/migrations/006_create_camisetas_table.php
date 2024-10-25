<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('camisetas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('equipo_id')->constrained('equipos')->onDelete('cascade');
            $table->integer('year_inicio');
            $table->integer('year_fin');
            $table->string('version', 100);
            $table->decimal('precio', 10, 2);
            $table->string('estado');
        });
    }

    public function down()
    {
        Schema::dropIfExists('camisetas');
    }
};
