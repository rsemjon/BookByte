<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DeliveryController extends Controller
{
    public function show()
{
    $order = Order::where('user_id', Auth::id())
        ->where('order_status', 'IN_PROGRESS')
        ->first();

    $dropBoxes = [
        'Bratislava - Šancová 112',
        'Košice - Trieda SNP 78',
        'Žilina - Hlavná 55',
    ];

    $stores = [
        'Bratislava - Eurovea Mall',
        'Košice - Aupark Shopping Center',
        'Nitra - OC Mlyny',
    ];

    return view('delivery', [
        'order' => $order,
        'dropBoxes' => $dropBoxes,
        'stores' => $stores,
        'selectedDropBox' => $order?->delivery_method === 'DROP_BOX' ? "{$order->city} - {$order->address}" : null,
        'selectedStore' => $order?->delivery_method === 'STORE' ? "{$order->city} - {$order->address}" : null,
    ]);
}


    public function store(Request $rq)
    {
        $rq->validate(['deliveryMethod' => 'required|in:HOME,DROP_BOX,STORE']);

        $order = Order::firstOrCreate(
            ['user_id' => Auth::id(), 'order_status' => 'IN_PROGRESS'],
            []
        );

        $deliveryMethod = $rq->deliveryMethod;
        $order->delivery_method = $deliveryMethod;

        $prefix = match ($deliveryMethod) {
            'HOME' => 'home',
            'DROP_BOX' => 'dropbox',
            'STORE' => 'store',
        };

        $order->first_name = $rq->input("first_name_$prefix");
        $order->last_name = $rq->input("last_name_$prefix");
        $order->email_address = $rq->input("email_address_$prefix");
        $order->phone_number = $rq->input("phone_number_$prefix");

        if ($deliveryMethod === 'HOME') {
            $rq->validate([
                'address' => 'required|string|max:255',
                'city' => 'required|string|max:255',
                'postal_code' => 'required|string|max:20',
            ]);
            $order->address = $rq->address;
            $order->city = $rq->city;
            $order->postal_code = $rq->postal_code;

        } elseif ($deliveryMethod === 'DROP_BOX') {
            $rq->validate(['dropBox' => 'required|string|max:255']);
            [$city, $addr] = array_map('trim', explode('-', $rq->dropBox, 2));
            $order->city = $city;
            $order->address = $addr;

        } elseif ($deliveryMethod === 'STORE') {
            $rq->validate(['storePickup' => 'required|string|max:255']);
            [$city, $addr] = array_map('trim', explode('-', $rq->storePickup, 2));
            $order->city = $city;
            $order->address = $addr;
        }

        $order->save();

        if (!Auth::check()) {
            session(['order_id' => $order->id]);
        }

        return redirect()->route('payment');
    }
}
