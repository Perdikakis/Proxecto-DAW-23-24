<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Talla extends Model
{
    use HasFactory;

    protected $table = 'tallas';

    protected $fillable = [
        'talla',
        'medidas',
    ];

    public function camisetas()
    {
        return $this->belongsToMany(Camiseta::class, 'camiseta_talla');
    }

    public function pedidos()
    {
        return $this->belongsToMany(Pedido::class, 'pedido_camiseta_talla')
                    ->withPivot('camiseta_id', 'cantidad');
    }
}
