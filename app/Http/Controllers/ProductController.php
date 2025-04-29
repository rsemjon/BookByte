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
        return view('product', compact('product', 'photosUrls'));
    }

    public function showEditSpecificProduct(Request $req, $id){
        $product = Product::findOrFail($id);
        $id = $product->id;
        $photosUrls = DB::table('product_image')
            ->where('product_id', $id)
            ->pluck('image')
            ->toArray();  
        return view('edit-product', compact('product', 'photosUrls'));

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

    public function updateProduct(Request $request, $id)
    {

        $product = Product::findOrFail($id);
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'author' => 'required|string|max:255',
            'description' => 'required|string',
            'genre' => 'required|string|max:255',
            'language' => 'required|in:Slovak,Russian,English,German', // must be one of these
            'price' => 'required|numeric|min:0|max:99999999.99', // match decimal(10,2)
            'in_stock' => 'required|integer|min:0',
        ]);


        if ($request->hasFile('photos')) {
            foreach ($request->file('photos') as $photo) {
                $customPath = public_path('images/books/' . $photo->getClientOriginalName());
            
                $photo->move(public_path('images/books'), $photo->getClientOriginalName());
    
                DB::table('product_image')->insert([
                    'product_id' => $product->id,
                    'image' => 'images/books/' . $photo->getClientOriginalName(),
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }

        $product->update($data);  

        // Redirect back with a success message
        return redirect()->route('show.edit.product', ['id' => $product->id]);
    }

    public function addProduct(Request $request)
    
    {
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'author' => 'required|string|max:255',
            'description' => 'required|string',
            'genre' => 'required|string|max:255',
            'language' => 'required|in:Slovak,Russian,English,German', // must be one of these
            'price' => 'required|numeric|min:0|max:99999999.99', // match decimal(10,2)
            'in_stock' => 'required|integer|min:0',
        ]);

        $product = Product::create([
            'title' => $data['title'],
            'author' => $data['author'],
            'description' => $data['description'],
            'genre' => $data['genre'],
            'language' => $data['language'],
            'price' => $data['price'],
            'in_stock' => $data['in_stock'],
        ]);

        if ($product){
            if ($request->hasFile('photos')) {
                foreach ($request->file('photos') as $photo) {
                    $customPath = public_path('images/books/' . $photo->getClientOriginalName());
                
                    $photo->move(public_path('images/books'), $photo->getClientOriginalName());
        
                    DB::table('product_image')->insert([
                        'product_id' => $product->id,
                        'image' => 'images/books/' . $photo->getClientOriginalName(),
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            }
        }

        return redirect()->route('show.edit.product', ['id' => $product->id]);
    }

    public function deleteProduct($id)
    {

        $images = DB::table('product_image')
        ->where('product_id', $id)
        ->pluck('image');



        foreach ($images as $imagePath) {
            $fullPath = public_path($imagePath);

            
            if (file_exists($fullPath)) {
                unlink($imagePath);
            }
        }

        DB::table('product_image')
            ->where('product_id', $id)
            ->delete();     
        
        $product = Product::findOrFail($id); 
        $product->delete();

        return redirect()->route('allProducts');
    }

    public function showAddProduct()
    {
        return view('add-product');
    }

    public function deletePhotoOfProduct(Request $request, $id)
    {
        
        $image_path = $request->image_path;
        $decoded = urldecode($image_path); 
        $fullPath = public_path($decoded);
    
        if (file_exists($fullPath)) {
             unlink($fullPath);
        }

        DB::table('product_image')
            ->where('product_id', $id)
            ->where('image', $decoded)
            ->delete();

        return redirect()->route('show.edit.product', ['id' => $id]);
    }

}
