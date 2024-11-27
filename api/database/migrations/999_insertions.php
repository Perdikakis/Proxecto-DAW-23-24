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
