<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PaymentController extends Controller
{
    public function show()
    {
        $order = Order::where('user_id', Auth::id())
            ->where('order_status', 'IN_PROGRESS')
            ->first();

        return view('payment', ['order' => $order]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'paymentMethod' => 'required|in:CASH,CREDIT_CARD,ONLINE_PAYMENT',
        ]);

        $order = Order::where('user_id', Auth::id())
            ->where('order_status', 'IN_PROGRESS')
            ->firstOrFail();

        $order->payment_method = $request->paymentMethod;
        $order->save();

        return redirect()->route('confirmation');
    }
}
