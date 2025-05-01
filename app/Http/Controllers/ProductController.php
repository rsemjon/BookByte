<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Services\ProductService;

class ProductController extends Controller
{
    public function showAllProducts(Request $request, ProductService $productService)

    {
        $data = $productService->getAllProductsData($request);
        return view('all-products', $data);
    }


    public function showSpecificProduct(Request $req, $id, ProductService $productService)
    {

        $data =   $productService->getProductData($id);
        return view('product', $data);
    }


    public function showEditSpecificProduct(Request $req, $id, ProductService $productService){
        if (!Auth::check() || Auth::user()->role !== 'admin') {
            abort(403, 'Unauthorized'); // returns the 403 Forbidden page
        }

        $data =   $productService->getProductData($id);
        return view('edit-product', $data); 

    }

    public function showHomeProducts(ProductService $productService)
    {
        $data =   $productService->getHomeProducts();
        return view('home', $data);
    }

    public function updateProduct(Request $request, $id, ProductService $productService)
    {
        

        if (!Auth::check() || Auth::user()->role !== 'admin') {
            abort(403, 'Unauthorized'); // returns the 403 Forbidden page
        }

        $product = $productService->updateProduct($request, $id);
        return redirect()->route('show.product', ['id' => $product->id]);
    }

    public function addProduct(Request $request, ProductService $productService)
    
    {
        if (!Auth::check() || Auth::user()->role !== 'admin') {
            abort(403, 'Unauthorized'); // returns the 403 Forbidden page
        }

        $product = $productService->addProduct($request);
        return redirect()->route('show.product', ['id' => $product->id]);
    }

    public function deleteProduct($id, ProductService $productService)
    {
        if (!Auth::check() || Auth::user()->role !== 'admin') {
            abort(403, 'Unauthorized'); // returns the 403 Forbidden page
        }

        $productService->deleteProduct($id);
        return redirect()->route('allProducts');
    }

    public function showAddProduct()
    {
        if (!Auth::check() || Auth::user()->role !== 'admin') {
            abort(403, 'Unauthorized'); // returns the 403 Forbidden page
        }
        return view('add-product');
    }

    public function deletePhotoOfProduct(Request $request, $id, ProductService $productService)
    {
        if (!Auth::check() || Auth::user()->role !== 'admin') {
            abort(403, 'Unauthorized'); // returns the 403 Forbidden page
        }

        
        $image_path = $request->image_path;
        $productService->deletePhotoOfProduct($image_path, $id);
        return redirect()->route('show.edit.product', ['id' => $id]);
    }

}
