<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function showAllProducts(Request $request)
    {
        // Retrieve all products from the database
        $all = DB::table('products')
        ->join(DB::raw('(SELECT DISTINCT ON (product_id) * FROM product_image ORDER BY product_id, id ASC) AS pi'), 'products.id', '=', 'pi.product_id')
        ->select('products.*', 'pi.image');

    // Filter by language if checkboxes are selected
        if ($request->has('language') && is_array($request->language)) {
            $languages = array_map('strtolower', $request->language);
            $all->whereIn(DB::raw('lower(products.language)'), $languages);
        }

        $products = $all->get();

        return view('all_products', compact('products'));
    }
}
