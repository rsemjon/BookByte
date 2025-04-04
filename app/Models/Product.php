<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;

    // Define the table name (optional if the table name is the plural of the model name)
    protected $table = 'products';

    // Define the fillable columns to allow mass assignment
    protected $fillable = [
        'title', 
        'author', 
        'description', 
        'genre', 
        'language', 
        'price',
        'in_stock',
        'total_purchased'
    ];

    // If you want to specify hidden columns, use the 'hidden' property
    protected $hidden = ['created_at', 'updated_at'];

    public function users()
    {
        return $this->belongsToMany(User::class);
    }

    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }
}
