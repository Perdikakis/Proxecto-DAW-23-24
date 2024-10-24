<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('equipo_competicion', function (Blueprint $table) {
            $table->foreignId('equipo_id')->constrained('equipos')->onDelete('cascade');
            $table->foreignId('competicion_id')->constrained('competiciones')->onDelete('cascade');
            $table->primary(['equipo_id', 'competicion_id']);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('equipo_competicion');
    }
}
;