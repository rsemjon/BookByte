{{-- components/add-product.blade.php --}}

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
    <title>Add Product</title>
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
                        <a href="{{ route('allProducts') }}" class="text-decoration-none text-dark">
                            All Books
                        </a>
                    </li>

                    <!-- New Product -->
                    <li class="breadcrumb-item active text-muted" aria-current="page">
                        New Product
                    </li>

                </ol>

            </nav>

        </div>
        
        <!-- Section -->
        <section class="col-md-8 col-12 d-flex flex-column align-items-center mx-auto">

            <!-- Images -->
            <div id="imagePreview" class="d-flex flex-wrap gap-3 mb-4 position-relative">

                <!-- Add Image Button -->
                <div id="addImageButton"
                     class="image-wrapper add-image d-flex align-items-center justify-content-center">
                    <i class="bi bi-plus-lg fs-1 text-secondary"></i>
                </div>

                @error('photos')
                    <div class="invalid-tooltip d-block">{{ $message }}</div>
                @enderror

            </div>

            <form id="productForm" class="w-100" action="{{ route('add.product') }}" method="POST" enctype="multipart/form-data">
                @csrf

                <input type="file" id="hiddenImageInput" name="photos[]" accept="image/*" multiple hidden>

                <!-- Title -->
                <div class="mb-3 position-relative">
                    <label for="productTitle" class="form-label">Title</label>
                    <input 
                           id="productTitle" 
                           name="title" 
                           required
                           placeholder="e.g., The Great Gatsby"
                           value="{{ old('title') }}"
                           class="form-control border-2 border-dark @error('title') is-invalid @enderror">
                    @error('title') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                </div>
                
                <!-- Author -->
                <div class="mb-3 position-relative">
                    <label for="productAuthor" class="form-label">Author</label>
                    <input 
                           id="productAuthor" 
                           name="author" 
                           required
                           placeholder="e.g., F. Scott Fitzgerald"
                           value="{{ old('author') }}"
                           class="form-control border-2 border-dark @error('author') is-invalid @enderror">
                    @error('author') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                </div>

                <!-- Description -->
                <div class="mb-3 position-relative">
                    <label class="form-label" for="productDescription">Description</label>
                    <textarea 
                              id="productDescription" 
                              name="description" 
                              rows="3" 
                              required
                              placeholder="e.g., A gripping thriller set in 19th-century London..."
                              class="form-control border-2 border-dark @error('description') is-invalid @enderror">{{ old('description') }}</textarea>
                    @error('description') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                </div>

                <!-- Price -->
                <div class="mb-3 position-relative">
                    <label for="productPrice" class="form-label">Price</label>
                    <input 
                           id="productPrice" 
                           name="price" 
                           type="number" 
                           step="0.01" 
                           min="0" 
                           required
                           placeholder="e.g., 12.34"
                           value="{{ old('price') }}"
                           class="form-control border-2 border-dark @error('price') is-invalid @enderror">
                    @error('price') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                </div>

                <!-- Genre -->
                <div class="mb-3 position-relative">
                    <label for="productGenre" class="form-label">Genre</label>
                    <input 
                           id="productGenre" 
                           name="genre" 
                           required
                           placeholder="e.g., Classic"
                           value="{{ old('genre') }}"
                           class="form-control border-2 border-dark @error('genre') is-invalid @enderror">
                    @error('genre') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                </div>

                <!-- Language -->
                <div class="mb-3 position-relative">
                    <label for="productLanguage" class="form-label">Language</label>
                    <input
                            id="productLanguage"
                            name="language"
                            type="text"
                            required
                            placeholder="e.g., English"
                            value="{{ old('language') }}"
                            class="form-control border border-2 border-dark @error('language') is-invalid @enderror">
                    @error('language') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                </div>
                
                <!-- In Stock -->
                <div class="mb-3 position-relative">
                    <label for="in_stock" class="form-label">In Stock</label>
                    <input 
                            id="in_stock" 
                            name="in_stock" 
                            type="number" 
                            min="0" 
                            step="1" 
                            required
                            placeholder="e.g., 123"
                            value="{{ old('in_stock') }}"
                            class="form-control border-2 border-dark @error('in_stock') is-invalid @enderror">
                    @error('in_stock') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                </div>

                <div class="mb-3 position-relative">
                    <label for="productCover" class="form-label">Cover</label>
                    <select
                        id="productCover"
                        name="cover_type"
                        required
                        class="form-select border border-2 border-dark @error('cover_type') is-invalid @enderror">
                        <option value="" disabled {{ old('cover_type') ? '' : 'selected' }}>Select a language</option>
                        <option value="Papercover" {{ old('cover_type') == 'Papercover' ? 'selected' : '' }}>Papercover</option>
                        <option value="Leather" {{ old('cover_type') == 'Leather' ? 'selected' : '' }}>Leather</option>
                        <option value="Hardcover" {{ old('cover_type') == 'Hardcover' ? 'selected' : '' }}>Hardcover</option>
                    </select>
                    @error('cover_type') 
                        <div class="invalid-tooltip d-block">{{ $message }}</div> 
                    @enderror
                </div>

                <!-- Save Button -->
                <button type="submit" class="btn btn-success mt-4 w-100">
                    Save <i class="fas fa-save ms-2"></i>
                </button>

            </form>

            <form class="w-100 mt-2" action="{{ route('allProducts') }}">

                <!-- Cancel Button -->
                <button type="submit" class="btn btn-danger mt-4 w-100">
                    Cancel <i class="fas fa-times ms-2"></i>
                </button>

            </form>

        </section>

    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/add-product.js"></script>
</body>

</html>