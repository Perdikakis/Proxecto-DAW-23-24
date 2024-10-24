<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    use HasFactory;

    protected $table = 'pedidos';

    protected $fillable = [
        'usuario_id',
        'direccion',
        'fecha_pedido',
        'fecha_envio',
        'fecha_finalizado',
        'estado',
        'total',
    ];

    public function usuario()
    {
        return $this->belongsTo(Usuario::class);
    }

    public function camisetas()
    {
        return $this->belongsToMany(Camiseta::class, 'pedido_camiseta_talla')
                    ->withPivot('talla_id', 'cantidad', 'dorsal', 'nombre_camiseta');
    }
}
