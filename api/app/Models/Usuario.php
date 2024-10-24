<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    use HasFactory;

    protected $table = 'usuarios';

    protected $fillable = [
        'usuario',
        'correo',
        'nombre',
        'apellidos',
        'direccion',
        'telefono',
        'rol',
        'fecha_alta',
        'fecha_ultimo_acceso',
    ];

    public function pedidos()
    {
        return $this->hasMany(Pedido::class);
    }
}
