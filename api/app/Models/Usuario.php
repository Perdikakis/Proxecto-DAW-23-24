<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Usuario extends Authenticatable
{
    use HasFactory, HasApiTokens, Notifiable;

    protected $table = 'usuarios';

    protected $fillable = [
        'usuario',
        'password',
        'correo',
        'nombre',
        'apellidos',
        'direccion',
        'telefono',
        'rol',
        'fecha_alta',
        'fecha_ultimo_acceso',
    ];

    public $timestamps = false;

    /**
     * Relación con el modelo Pedido.
     * Un usuario puede tener muchos pedidos.
     */
    public function pedidos()
    {
        return $this->hasMany(Pedido::class);
    }
}
