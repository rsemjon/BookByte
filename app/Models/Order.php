<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'first_name',
        'last_name',
        'phone_number',
        'email_address',
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
}
