<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Usuario extends Model
{
    use HasFactory;
    use HasApiTokens, Notifiable;

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

    public function pedidos()
    {
        return $this->hasMany(Pedido::class);
    }
}
