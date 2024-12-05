<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Camiseta extends Model
{
    use HasFactory;

    protected $table = 'camisetas';

    protected $fillable = [
        'nombre',
        'equipo_id',
        'year_inicio',
        'year_fin',
        'estado',
        'precio',
    ];

    public function equipo()
    {
        return $this->belongsTo(Equipo::class);
    }

    public function tallas()
    {
        return $this->belongsToMany(Talla::class, 'camiseta_talla')
                    ->withPivot('stock', 'ventas');
    }

    public function pedidos()
    {
        return $this->belongsToMany(Pedido::class, 'pedido_camiseta_talla')
                    ->withPivot('talla_id', 'cantidad', 'nombre', 'dorsal');
    }

    public function images()
    {
        return $this->morphMany(Imagen::class, 'imageable');
    }
}

