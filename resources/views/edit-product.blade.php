{{-- components/edit-product.blade.php --}}

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.css">
    <link rel="stylesheet" href="/css/custom.css">
    <title>Edit Product</title>
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    @include('components.header')

    <!-- Main -->
    <main class="container flex-fill mt-5 pt-4 pb-5 mb-5">

        <hr>

        <div class="d-flex justify-content-between align-items-center mb-2">

            <!-- Nav -->
            <nav aria-label="breadcrumb" class="mt-0">

                <!-- Breadcrumbs -->
                <ol class="breadcrumb">

                    <!-- Home -->
                    <li class="breadcrumb-item">
                        <a href="{{ route('home') }}" class="text-decoration-none text-dark">
                            <i class="bi bi-house-door-fill"></i> Home
                        </a>
                    </li>

                    <!-- All Books -->
                    <li class="breadcrumb-item">
                        <a href="{{ route('allProducts') }}" class="text-decoration-none text-dark">All Books</a>
                    </li>

                    <!-- Title -->
                    <li class="breadcrumb-item">
                        <a href="{{ route('show.product', $product->id) }}" class="text-decoration-none text-dark">
                            {{ $product->title }}
                        </a>
                    </li>
                    
                    <!-- Edit Product -->
                    <li class="breadcrumb-item active text-muted" aria-current="page">Edit Product</li>

                </ol>

            </nav>

        </div>

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        
        <!-- Section -->
        <section class="col-md-8 col-12 d-flex flex-column align-items-center mx-auto">

            <!-- Images -->
            <div id="imagePreview" class="d-flex flex-wrap gap-3 mb-4">

                <!-- Database Images -->
                @foreach ($photosUrls as $url)
                    <div class="image-wrapper position-relative">

                        <!-- Image -->
                        <img src="/{{ $url }}" class="w-100 h-100 object-fit-cover rounded">

                        <!-- Delete Button -->
                        <button type="button" class="btn btn-danger btn-sm delete-btn position-absolute top-0 end-0 m-1" data-path="{{ $url }}">
                            <i class="bi bi-x-lg"></i>
                        </button>

                    </div>
                @endforeach

                <!-- Add Image Button -->
                <div id="addImageButton" class="image-wrapper add-image d-flex align-items-center justify-content-center">
                    <i class="bi bi-plus-lg fs-1 text-secondary"></i>
                </div>

            </div>

            <form id="productForm" class="w-100" action="{{ route('update.product', $product->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')

                <div id="deletePlaceHolder"></div>

                <input type="file" id="hiddenImageInput" name="photos[]" accept="image/*" multiple hidden>
                
                <!-- Title -->
                <div class="mb-3">
                    <label for="productTitle" class="form-label">Title</label>
                    <input name="title" id="productTitle" class="form-control border border-2 border-dark" value="{{ old('title', $product->title) }}">
                </div>

                <!-- Author -->
                <div class="mb-3">
                    <label for="productAuthor" class="form-label">Author</label>
                    <input name="author" id="productAuthor" class="form-control border border-2 border-dark" value="{{ old('author', $product->author) }}">
                </div>

                <!-- Description -->
                <div class="mb-3">
                    <label for="productDescription" class="form-label">Description</label>
                    <textarea name="description" id="productDescription" rows="3" class="form-control border border-2 border-dark">{{ old('description', $product->description) }}</textarea>
                </div>

                <!-- Price -->
                <div class="mb-3">
                    <label for="productPrice" class="form-label">Price</label>
                    <input type="number" step="0.01" min="0" name="price" id="productPrice" class="form-control border border-2 border-dark" value="{{ old('price', $product->price) }}">
                </div>

                <!-- Genre -->
                <div class="mb-3">
                    <label for="productGenre" class="form-label">Genre</label>
                    <input name="genre" id="productGenre" class="form-control border border-2 border-dark" value="{{ old('genre', $product->genre) }}">
                </div>

                <!-- Language -->
                <div class="mb-3">
                    <label for="productLanguage" class="form-label">Language</label>
                    <input name="language" id="productLanguage" class="form-control border border-2 border-dark" value="{{ old('language', $product->language) }}">
                </div>

                <!-- In Stock -->
                <div class="mb-3">
                    <label for="in_stock" class="form-label">In Stock</label>
                    <input name="in_stock" id="in_stock" class="form-control border border-2 border-dark" value="{{ old('in_stock', $product->in_stock) }}">
                </div>

                <!-- Save Button -->
                <button type="submit" class="btn btn-success mt-4 w-100">
                    Save <i class="fas fa-save ms-2"></i>
                </button>

            </form>

            <form class="w-100 mt-2" action="{{ route('delete.product', $product->id) }}" method="POST">
                @csrf

                @method('DELETE')

                <!-- Delete Button -->
                <button type="submit" class="btn btn-danger mt-4 w-100">
                    Delete <i class="fas fa-trash ms-2"></i>
                </button>
                
            </form>
            
        </section>

    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/edit-product.js"></script>
</body>

</html>