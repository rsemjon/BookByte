<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Intervention\Image\ImageManagerStatic as Image;
use Illuminate\Support\Facades\Validator;

class ProductService
{
    
    public function getAllProductsData(Request $request): array
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
        $selectedCoverTypes = array_map('trim', $request->cover_type ?? []);

        $availableGenres = Product::select('genre')->distinct()->pluck('genre')->sort()->values();
        $availableLanguages = Product::select('language')->distinct()->pluck('language')->sort()->values();
        $availableAuthors = Product::select('author')->distinct()->pluck('author')->sort()->values();
        $availableCoverTypes = Product::select('cover_type')->distinct()->pluck('cover_type')->sort()->values();

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

        if ($request->has('cover_type') && is_array($request->cover_type)) {
            $all->whereIn('products.cover_type', $request->cover_type);
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

        return [
            'products' => $products,
            'availableGenres' => $availableGenres,
            'availableLanguages' => $availableLanguages,
            'availableAuthors' => $availableAuthors,
            'availableCoverTypes' => $availableCoverTypes,
            'minPrice' => $minPrice,
            'maxPrice' => $maxPrice,
            'selectedGenres' => $selectedGenres,
            'selectedLanguages' => $selectedLanguages,
            'selectedAuthors' => $selectedAuthors,
            'selectedCoverTypes' => $selectedCoverTypes,
        ];
    }

    public function getProductData($id): array
    {
        $product = Product::findOrFail($id);
        $id = $product->id;
        $photosUrls = DB::table('product_image')
            ->where('product_id', $id)
            ->pluck('image')
            ->toArray();  
        
        return [
            'product' => $product,
            'photosUrls' => $photosUrls   
        ];

    }

    public function getHomeProducts(): array
    {
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

        return [
            'bestsellers' => $bestsellers,
            'newcomers' => $newcomers,
            'trending' => $trending
        ];

    }

    public function updateProduct(Request $r, int $id): Product
    {
        $product = Product::findOrFail($id);

        // valiadtion
        $validator = Validator::make($r->all(), [
            'title' => 'bail|required|string|max:255',
            'author' => 'bail|required|string|max:255',
            'description' => 'bail|required|string',
            'genre' => 'bail|required|string|max:255',
            'language' => 'bail|required|string|max:255',
            'price' => 'bail|required|numeric|min:0|max:99999999.99',
            'in_stock' => 'bail|required|integer|min:0',
            'cover_type' => 'bail|required',
        ]);

        $current  = DB::table('product_image')->where('product_id', $id)->count();
        $toDelete = count($r->input('delete_existing', []));
        $toAdd    = $r->hasFile('photos') ? count($r->file('photos')) : 0;

        $validator->after(function ($v) use ($current, $toDelete, $toAdd) {
            if ($current - $toDelete + $toAdd < 2) {
                $v->errors()->add('photos', 'The product must have at least 2 images.');
            }
        });

        $data = $validator->validate(); 

        // removing 
        foreach ($r->input('delete_existing', []) as $relPath) {
            File::delete(public_path($relPath));
            DB::table('product_image')
              ->where('product_id', $id)
              ->where('image', $relPath)
              ->delete();
        }

        // adding new
        if ($r->hasFile('photos')) {
            $files = $r->file('photos');
            if (!is_array($files)) $files = [$files];
    
            $dest = public_path('images/books');
            if (!is_dir($dest)) mkdir($dest, 0755, true);
    
            foreach ($files as $photo) {
                $name = uniqid() . '.' . $photo->getClientOriginalExtension();

                $image = Image::make($photo->getRealPath());
                $size = min($image->width(), $image->height());
                $image->crop($size, $size)->resize(800, 800)->save($dest . '/' . $name, 90);

                DB::table('product_image')->insert([
                    'product_id' => $id,
                    'image' => 'images/books/' . $name,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        $product->update($data);
        return $product;
    }

    public function addProduct(Request $r): Product
    {
        // validation
        $validator = Validator::make($r->all(), [
            'title' => 'bail|required|string|max:255',
            'author' => 'bail|required|string|max:255',
            'description' => 'bail|required|string',
            'genre' => 'bail|required|string|max:255',
            'language' => 'bail|required|string|max:255',
            'price' => 'bail|required|numeric|min:0|max:99999999.99',
            'in_stock' => 'bail|required|integer|min:0',
            'cover_type' => 'bail|required',
        ]);

        $validator->after(function($v) use($r){
            $cnt = $r->hasFile('photos') ? count($r->file('photos')) : 0;
            if ($cnt < 2) $v->errors()->add('photos','The product must have at least 2 images.');
        });
        

        $data = $validator->validate();

        // create product
        $product = Product::create($data);

        // save images
        if ($r->hasFile('photos')) {

            $files = $r->file('photos');
            if (!is_array($files)) {
                $files = [$files];
            }

            $dest = public_path('images/books');
            if (!is_dir($dest)) {
                mkdir($dest, 0755, true);
            }

            foreach ($files as $photo) {

                $name = uniqid() . '.' . $photo->getClientOriginalExtension();

                $image = Image::make($photo->getRealPath());
                $size  = min($image->width(), $image->height());
                $image->crop($size, $size)
                      ->resize(800, 800)
                      ->save($dest . '/' . $name, 90);

                DB::table('product_image')->insert([
                    'product_id' => $product->id,
                    'image'      => 'images/books/' . $name,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        return $product;
    }

    public function deleteProduct($id)
    {
        $images = DB::table('product_image')
        ->where('product_id', $id)
        ->pluck('image');

        foreach ($images as $imagePath) {
            $fullPath = public_path($imagePath);
            if (file_exists($fullPath)) {
                unlink($fullPath);
            }
        }

        DB::table('product_image')
            ->where('product_id', $id)
            ->delete();     
        
        $product = Product::findOrFail($id); 
        $product->delete();
    }

    public function deletePhotoOfProduct($image_path, $id)
    {
        $decoded = urldecode($image_path); 
        $fullPath = public_path($decoded);
    
        if (file_exists($fullPath)) {
             unlink($fullPath);
        }

        DB::table('product_image')
            ->where('product_id', $id)
            ->where('image', $decoded)
            ->delete();
    }

   

}