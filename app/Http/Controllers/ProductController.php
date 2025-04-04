<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function showAllProducts()
    {
        // Retrieve all products from the database
        $products = DB::table('products')
        ->join(DB::raw('(SELECT DISTINCT ON (product_id) * FROM product_image ORDER BY product_id, id ASC) AS pi'), 'products.id', '=', 'pi.product_id')
        ->select('products.*', 'pi.image')
        ->get();

        return view('all_products', compact('products'));
    }
}
