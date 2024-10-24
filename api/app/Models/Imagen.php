<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Imagen extends Model
{
    use HasFactory;

    protected $table = 'images';

    protected $fillable = [
        'imageable_type_id',
        'imageable_id',
        'ruta',
        'nombre_archivo',
        'tipo_mime',
    ];

    public function imageable()
    {
        return $this->morphTo();
    }
}
