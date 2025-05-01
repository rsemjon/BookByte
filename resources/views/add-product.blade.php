<!-- add-product.html -->

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
    <!-- Main Content -->
    <main class="container flex-fill mt-5 pt-4 pb-5 mb-5">
        <hr>

        <div class="d-flex justify-content-between align-items-center mb-2">

            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mt-0">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="{{ route('home') }}" class="text-decoration-none text-dark">
                            <i class="bi bi-house-door-fill"></i> Home
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="{{ route('allProducts') }}" class="text-decoration-none text-dark">
                            All Books
                        </a>
                    </li>
                    <li     class="breadcrumb-item active text-muted" aria-current="page">
                        New Product
                    </li>
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

        <div class="col-md-8 col-12 d-flex flex-column align-items-center mx-auto">
            <div id="imagePreview" class="d-flex flex-wrap gap-3 mb-4">
                <div id="addImageButton"
                     class="image-wrapper add-image d-flex align-items-center justify-content-center">
                    <i class="bi bi-plus-lg fs-1 text-secondary"></i>
                </div>
            </div>

            <form id="productForm" class="w-100" action="{{ route('add.product') }}" method="POST" enctype="multipart/form-data">
                @csrf

                <input type="file" id="hiddenImageInput" name="photos[]" accept="image/*" multiple hidden>

                <div class="mb-3">
                    <label for="productTitle" class="form-label">Title</label>
                    <input name="title" id="productTitle" class="form-control border border-2 border-dark" value="{{ old('title') }}">
                </div>

                <div class="mb-3">
                    <label for="productAuthor" class="form-label">Author</label>
                    <input name="author" id="productAuthor" class="form-control border border-2 border-dark" value="{{ old('author') }}">
                </div>

                <div class="mb-3">
                    <label for="productDescription" class="form-label">Description</label>
                    <textarea name="description" id="productDescription" rows="3" class="form-control border border-2 border-dark">{{ old('description') }}</textarea>
                </div>

                <div class="mb-3">
                    <label for="productPrice" class="form-label">Price</label>
                    <input type="number" step="0.01" min="0" name="price" id="productPrice" class="form-control border border-2 border-dark" value="{{ old('price') }}">
                </div>

                <div class="mb-3">
                    <label for="productGenre" class="form-label">Genre</label>
                    <input name="genre" id="productGenre" class="form-control border border-2 border-dark" value="{{ old('genre') }}">
                </div>

                <div class="mb-3">
                    <label for="productLanguage" class="form-label">Language</label>
                    <input name="language" id="productLanguage" class="form-control border border-2 border-dark" value="{{ old('language') }}">
                </div>

                <div class="mb-3">
                    <label for="in_stock" class="form-label">In Stock</label>
                    <input name="in_stock" id="in_stock" class="form-control border border-2 border-dark" value="{{ old('in_stock') }}">
                </div>

                <button type="submit" class="btn btn-success mt-4 w-100">
                    Save <i class="fas fa-save ms-2"></i>
                </button>
            </form>

            <form class="w-100 mt-2" action="{{ route('allProducts') }}">
                <button type="submit" class="btn btn-danger mt-4 w-100">
                    Cancel <i class="fas fa-times ms-2"></i>
                </button>
            </form>
        </div>
    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/add-product.js"></script>
</body>

</html>