<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    private function getOrder(): ?Order
    {
        return Order::where('user_id', Auth::id())
            ->where('order_status', 'IN_PROGRESS')
            ->first();
    }

    public function index()
    {
        $order = $this->getOrder();

        if (!$order) {
            return view('shopping-cart', ['items' => collect(), 'total' => 0]);
        }

        $items = DB::table('orders_products')
            ->join('products', 'products.id', '=', 'orders_products.product_id')
            ->join(DB::raw('(SELECT DISTINCT ON (product_id) * FROM product_image ORDER BY product_id, id ASC) AS pi'),
                'products.id', '=', 'pi.product_id')
            ->select('products.*', 'orders_products.quantity as qty', 'pi.image')
            ->where('orders_products.order_id', $order->id)
            ->get()
            ->map(function ($p) {
                $p->sum = $p->qty * $p->price;
                return $p;
            });

        $total = $items->sum('sum');

        return view('shopping-cart', compact('items', 'total'));
    }

    public function add(Request $request, Product $product)
    {
        $order = $this->getOrder();

        if (!$order) {
            $order = Order::create([
                'user_id' => Auth::id(),
                'order_status' => 'IN_PROGRESS',
                'first_name' => Auth::user()->name ?? '',
                'last_name' => '',
                'phone_number' => '',
                'email_address' => Auth::user()->email ?? '',
                'address' => '',
                'city' => '',
                'postal_code' => '',
            ]);
        }

        $qty = max(1, (int)$request->input('qty', 1));

        $existing = DB::table('orders_products')
            ->where('order_id', $order->id)
            ->where('product_id', $product->id)
            ->first();

        if ($existing) {
            DB::table('orders_products')
                ->where('id', $existing->id)
                ->update(['quantity' => $existing->quantity + $qty]);
        } else {
            DB::table('orders_products')->insert([
                'order_id' => $order->id,
                'product_id' => $product->id,
                'quantity' => $qty,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        $totalQty = DB::table('orders_products')
            ->where('order_id', $order->id)
            ->sum('quantity');

        return $request->ajax()
            ? response()->json(['ok' => true, 'totalQty' => $totalQty])
            : back()->with('ok', 'Added to cart');
    }

    public function update(Request $request, Product $product)
    {
        $order = $this->getOrder();

        if (!$order) {
            return response()->json(['error' => 'Order not found'], 404);
        }

        $qty = max(1, (int)$request->input('qty', 1));

        DB::table('orders_products')
            ->where('order_id', $order->id)
            ->where('product_id', $product->id)
            ->update(['quantity' => $qty, 'updated_at' => now()]);

        return response()->json(['ok' => true]);
    }

    public function remove(Product $product)
    {
        $order = $this->getOrder();

        if (!$order) {
            return response()->json(['ok' => true]);
        }

        DB::table('orders_products')
            ->where('order_id', $order->id)
            ->where('product_id', $product->id)
            ->delete();

        $remaining = DB::table('orders_products')
            ->where('order_id', $order->id)
            ->count();

        if ($remaining === 0) {
            $order->delete();
        }

        return response()->json(['ok' => true]);
    }
}
