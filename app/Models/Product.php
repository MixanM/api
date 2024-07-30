<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'price', 'quantity'];

    public function properties()
    {
        return $this->belongsToMany(Property::class, 'product_property', 'product_id', 'property_id')->withPivot('value');
    }
}
