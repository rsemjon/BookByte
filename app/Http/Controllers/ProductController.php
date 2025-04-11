<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function showAllProducts(Request $request)

    {

        $sortOptions = [
            'price-asc' => ['price', 'asc'],
            'price-desc' => ['price', 'desc'],
            'bestsellers' => ['total_purchased', 'desc'],
            'newest' => ['created_at', 'desc'],
        ];

        $min = $request->input('priceMin');
        $max = $request->input('priceMax');
        $sortOption = $request->input('sortOption');
        $selectedLanguages = $request->language ?? [];
        $selectedAuthors =array_map('trim', $request->author ?? []);
        $selectedGenres = array_map('trim', $request->genre ?? []);

        $all = DB::table('products')
        ->join(DB::raw('(SELECT DISTINCT ON (product_id) * FROM product_image ORDER BY product_id, id ASC) AS pi'), 'products.id', '=', 'pi.product_id')
        ->select('products.*', 'pi.image');

        if ($request->has('language') && is_array($request->language)) {
            $languages = array_map('strtolower', $request->language);
            $all->whereIn(DB::raw('lower(products.language)'), $languages);
        }

        if ($request->has('author') && is_array($request->author)) {
            $all->whereIn('products.author', $request->author);
        }

        if ($request->has('genre') && is_array($request->genre)) {
            $all->whereIn('products.genre', $request->genre);
        }

        if ($min !== null && $max !== null) {
            $all->whereBetween('products.price', [$min, $max]);
        }

        if (isset($sortOptions[$sortOption])) {
            [$column, $direction] = $sortOptions[$sortOption];
            $all->orderBy($column, $direction);
        }
        
        $products = $all->get();
        return view('all_products', compact('products', 'selectedLanguages', 'selectedAuthors', 'selectedGenres'));
    }
}
