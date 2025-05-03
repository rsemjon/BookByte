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
        // validation=
        $rules = [
            'deliveryMethod' => 'required|in:HOME,DROP_BOX,STORE',
        
            // HOME
            'first_name_home' => 'nullable|required_if:deliveryMethod,HOME|string|regex:/^[\p{L}\s\-]+$/u|max:255',
            'last_name_home' => 'nullable|required_if:deliveryMethod,HOME|string|regex:/^[\p{L}\s\-]+$/u|max:255',
            'email_address_home'=> 'nullable|required_if:deliveryMethod,HOME|email:rfc,dns|max:255',
            'phone_number_home' => 'nullable|required_if:deliveryMethod,HOME|regex:/^\+[1-9][0-9]{7,14}$/',
            'address' => 'nullable|required_if:deliveryMethod,HOME|string|max:255',
            'city' => 'nullable|required_if:deliveryMethod,HOME|string|max:255',
            'postal_code' => 'nullable|required_if:deliveryMethod,HOME|regex:/^[A-Za-z0-9\s\-]{3,20}$/',
        
            // DROP_BOX
            'first_name_dropbox' => 'nullable|required_if:deliveryMethod,DROP_BOX|string|regex:/^[\p{L}\s\-]+$/u|max:255',
            'last_name_dropbox' => 'nullable|required_if:deliveryMethod,DROP_BOX|string|regex:/^[\p{L}\s\-]+$/u|max:255',
            'email_address_dropbox' => 'nullable|required_if:deliveryMethod,DROP_BOX|email:rfc,dns|max:255',
            'phone_number_dropbox' => 'nullable|required_if:deliveryMethod,DROP_BOX|regex:/^\+[1-9][0-9]{7,14}$/',
            'dropBox' => 'nullable|required_if:deliveryMethod,DROP_BOX|string|max:255',
        
            // STORE
            'first_name_store' => 'nullable|required_if:deliveryMethod,STORE|string|regex:/^[\p{L}\s\-]+$/u|max:255',
            'last_name_store' => 'nullable|required_if:deliveryMethod,STORE|string|regex:/^[\p{L}\s\-]+$/u|max:255',
            'email_address_store' => 'nullable|required_if:deliveryMethod,STORE|email:rfc,dns|max:255',
            'phone_number_store' => 'nullable|required_if:deliveryMethod,STORE|regex:/^\+[1-9][0-9]{7,14}$/',
            'storePickup' => 'nullable|required_if:deliveryMethod,STORE|string|max:255',
        ];
        $validated = $rq->validate($rules);


        $validated = $rq->validate($rules);

        // order
        $order = Order::firstOrCreate(
            ['user_id' => Auth::id(), 'order_status' => 'IN_PROGRESS'],
            []
        );

        $method = $validated['deliveryMethod']; // HOME | DROP_BOX | STORE
        $order->delivery_method = $method;

        $prefix = match ($method) {
            'HOME'     => 'home',
            'DROP_BOX' => 'dropbox',
            'STORE'    => 'store',
        };

        // common fields
        $order->first_name = $validated["first_name_$prefix"];
        $order->last_name = $validated["last_name_$prefix"];
        $order->email_address = $validated["email_address_$prefix"];
        $order->phone_number = $validated["phone_number_$prefix"];

        // address depends on type
        if ($method === 'HOME') {
            $order->address = $validated['address'];
            $order->city = $validated['city'];
            $order->postal_code = $validated['postal_code'];

        } elseif ($method === 'DROP_BOX') {
            [$city, $addr] = array_map('trim', explode('-', $validated['dropBox'], 2));
            $order->city = $city;
            $order->address = $addr;

        } else { // STORE
            [$city, $addr] = array_map('trim', explode('-', $validated['storePickup'], 2));
            $order->city = $city;
            $order->address = $addr;
        }

        $order->save();

        // add fields
        if (Auth::check()) {
            $user = Auth::user();
    
            if (!$user->last_name && $order->last_name) {
                $user->last_name = $order->last_name;
            }
            if (!$user->phone_number && $order->phone_number) {
                $user->phone_number = $order->phone_number;
            }
    
            if ($user->isDirty(['last_name', 'phone_number'])) {
                $user->save();
            }
        } else {
            // guest
            session(['order_id' => $order->id]);
        }

        return redirect()->route('payment');
    }
}
