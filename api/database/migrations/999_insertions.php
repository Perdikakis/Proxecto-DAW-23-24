<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $path = database_path('datos.sql');

        if (File::exists($path)) {
            $sql = File::get($path);

            DB::unprepared($sql);
        } else {
            throw new Exception("El archivo SQL no existe: $path");
        }

        \App\Models\Usuario::create([
            'usuario' => 'Administrador',
            'correo' => 'correo@ejemplo.com',
            'password' => bcrypt('password'),
            'fecha_ultimo_acceso' => now(),
            'rol_id' => 1,
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        
    }
};
