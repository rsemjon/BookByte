<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ConfirmationController extends Controller
{
    public function show()
    {
        $order = Auth::check()
            ? Order::where('user_id', Auth::id())
                  ->where('order_status', 'IN_PROGRESS')
                  ->firstOrFail()
            : Order::whereNull('user_id')
                  ->where('id', session('order_id'))
                  ->where('order_status', 'IN_PROGRESS')
                  ->firstOrFail();

        $order->load(['products' => function ($q) {
            $q->leftJoin(
                DB::raw('(SELECT DISTINCT ON (product_id) product_id, image
                            FROM product_image
                            ORDER BY product_id, id) AS pi'),
                'pi.product_id',
                '=',
                'products.id'
            )
            ->addSelect('products.*')
            ->addSelect('pi.image');
        }]);
                
        $deliveryMeta = [
            'HOME' => ['label' => 'Home Delivery', 'price' => 3.50],
            'DROP_BOX' => ['label' => 'Drop Box', 'price' => 1.80],
            'STORE' => ['label' => 'Store Pickup', 'price' => 0.00],
        ];
        $paymentMeta = [
            'CASH' => ['label' => 'Cash (on Delivery)', 'price' => 1.50],
            'CREDIT_CARD' => ['label' => 'Card', 'price' => 0.00],
            'ONLINE_PAYMENT' => ['label' => 'Online Payment', 'price' => 0.00],
        ];

        $deliveryCost = $deliveryMeta[$order->delivery_method]['price'] ?? 0;
        $paymentCost  = $paymentMeta[$order->payment_method]['price'] ?? 0;

        $deliveryLabel = match ($order->delivery_method) {
            'HOME' => "Home Delivery - {$order->city}, {$order->address}, {$order->postal_code}",
            'DROP_BOX' => "Drop Box - {$order->city}, {$order->address}",
            'STORE' => "Store - {$order->city}, {$order->address}",
            default => '-',
        };

        $itemsTotal = $order->products->sum(fn ($p) => $p->price * $p->pivot->quantity);
        $finalTotal = $itemsTotal + $deliveryCost + $paymentCost;

        return view('confirmation', [
            'order'         => $order,
            'products'      => $order->products,
            'deliveryLabel' => $deliveryLabel,
            'deliveryCost'  => $deliveryCost,
            'paymentLabel'  => $paymentMeta[$order->payment_method]['label'] ?? '—',
            'paymentCost'   => $paymentCost,
            'finalTotal'    => $finalTotal,
        ]);
    }

    public function confirm()
    {
        $order = Auth::check()
            ? Order::with('products')->where('user_id', Auth::id())
                  ->where('order_status', 'IN_PROGRESS')->firstOrFail()
            : Order::with('products')->whereNull('user_id')
                  ->where('id', session('order_id'))
                  ->where('order_status', 'IN_PROGRESS')->firstOrFail();

        foreach ($order->products as $p) {
            $p->in_stock        -= $p->pivot->quantity;
            $p->total_purchased += $p->pivot->quantity;
            $p->save();
        }

        $order->order_status = 'FINISHED';
        $order->save();

        return redirect()->route('home')->with('success', 'Super, your order confirmed!');
    }
}
