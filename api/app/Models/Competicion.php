<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Competicion extends Model
{
    use HasFactory;

    protected $table = 'competiciones';

    protected $fillable = [
        'localizacion',
        'nombre',
    ];

    public function equipos()
    {
        return $this->belongsToMany(Equipo::class, 'equipo_competicion');
    }

    public function imagen()
    {
        return $this->morphOne(Imagen::class, 'imageable');
    }
}
