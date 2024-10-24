<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipoImageable extends Model
{
    use HasFactory;

    protected $table = 'tipos_imageable';

    protected $fillable = [
        'nombre',
    ];

    public function images()
    {
        return $this->hasMany(Imagen::class, 'imageable_type_id');
    }
}