<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'order_status',
        'first_name',
        'last_name',
        'phone_number',
        'email_address',
        'delivery_method',
        'address',
        'city',
        'postal_code',
        'state',
        'payment_method',
    ];

    public function orders()
    {
        return $this->belongsToMany(Order::class);    
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'orders_products')
            ->withPivot('quantity')
            ->withTimestamps();
    }    
}
