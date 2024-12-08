<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Equipo extends Model
{
    use HasFactory;

    protected $table = 'equipos';

    protected $fillable = [
        'nombre',
    ];

    public function imagen()
    {
        return $this->morphOne(Imagen::class, 'imageable');
    }

    public function competiciones()
    {
        return $this->belongsToMany(Competicion::class, 'equipo_competicion');
    }

    public function camisetas()
    {
        return $this->hasMany(Camiseta::class);
    }
}
