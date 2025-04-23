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

        $availableGenres = Product::select('genre')->distinct()->pluck('genre')->sort()->values();
        $availableLanguages = Product::select('language')->distinct()->pluck('language')->sort()->values();
        $availableAuthors = Product::select('author')->distinct()->pluck('author')->sort()->values();

        $minPrice = floor(Product::min('price'));
        $maxPrice = ceil(Product::max('price'));

        $searched_text=$request->input('searched_value');
        
        if ($searched_text) {
            $all = DB::table('products')
            ->join(DB::raw('(SELECT DISTINCT ON (product_id) * FROM product_image ORDER BY product_id, id ASC) AS pi'), 'products.id', '=', 'pi.product_id')
            ->where('title', 'ILIKE', "%{$searched_text}%")
            ->orWhere('author', 'ILIKE', "%{$searched_text}%")
            ->select('products.*', 'pi.image');
        }
        else{
            $all = DB::table('products')
            ->join(DB::raw('(SELECT DISTINCT ON (product_id) * FROM product_image ORDER BY product_id, id ASC) AS pi'), 'products.id', '=', 'pi.product_id')
            ->select('products.*', 'pi.image');
    
        }

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
        else{
            $all->orderBy('total_purchased', 'desc');
        }
        
        $products = $all->paginate(5);

        return view('all-products', compact(
            'products',
            'availableGenres',
            'availableLanguages',
            'availableAuthors',
            'minPrice',
            'maxPrice',
            'selectedGenres',
            'selectedLanguages',
            'selectedAuthors'
        ));
    }

    public function showSpecificProduct(Request $req, $id)
    {
        $product = Product::findOrFail($id);
        $id = $product->id;
        $photosUrls = DB::table('product_image')
            ->where('product_id', $id)
            ->pluck('image')
            ->toArray();  
        return view('one-product', compact('product', 'photosUrls'));
    }

    public function showHomeProducts()
    {
        // image query
        $imageJoin = DB::raw('(SELECT DISTINCT ON (product_id) * FROM product_image ORDER BY product_id, id ASC) AS pi');

        // bestsellers - 7 most purchased
        $bestsellers = DB::table('products')
            ->join($imageJoin, 'products.id', '=', 'pi.product_id')
            ->select('products.*', 'pi.image')
            ->orderByDesc('total_purchased')
            ->take(7)
            ->get();

        // newcomers - 7 most new added
        $newcomers = DB::table('products')
            ->join($imageJoin, 'products.id', '=', 'pi.product_id')
            ->select('products.*', 'pi.image')
            ->orderByDesc('created_at')
            ->take(7)
            ->get();

        // trending - 7 idk
        $trending = DB::table('products')
            ->join($imageJoin, 'products.id', '=', 'pi.product_id')
            ->select('products.*', 'pi.image')
            ->where('total_purchased', '>', 0)
            ->where('in_stock', '>', 0)
            ->inRandomOrder()
            ->take(7)
            ->get();

        return view('home', compact('bestsellers', 'newcomers', 'trending'));
    }

}
