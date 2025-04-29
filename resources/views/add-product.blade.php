
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.js"></script>
    <link rel="stylesheet" href="/css/custom.css">
    <title>Admin Page</title>
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    @include('components.header')
    <!-- Main Content -->
    <main class="container flex-fill mt-5 pt-4 pb-5 mb-5">

        <hr />

        <div class="d-flex justify-content-between align-items-center mb-2">

            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mt-0">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="index.html" class="text-decoration-none text-dark">
                            <i class="bi bi-house-door-fill"></i> Home
                        </a>
                    </li>
                    <li class="breadcrumb-item" id="bookTitleBreadcrumb">New Product</li>
                    <li class="breadcrumb-item active text-muted" id="breadcrumbAction" aria-current="page"></li>
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

            <h1 class="mb-5">Add new product</h1>
            

            <!-- Hidden file input -->
            <!-- <input type="file" id="hiddenImageInput" accept="image/*" multiple style="display: none;" /> -->

            <div id="imagePreview" class="d-flex flex-wrap gap-3 mb-4"></div>

            <input type="file" id="hiddenImageInput" accept="image/*" multiple style="display: none;" />

            <form class="w-100" id="productForm" action="{{ route('add.product') }}" method="POST" enctype="multipart/form-data">
                @csrf
                
                <div class="mb-3">
                <input type="file" name="photos[]" class="form-control border border-2 border-dark" id="productPhotos" multiple />
                </div>

                <div class="mb-3">
                    <label for="productTitle" class="form-label">Title</label>
                    <input type="text" name="title" class="form-control border border-2 border-dark" id="productTitle" />
                </div>

                <div class="mb-3">
                    <label for="productAuthor" class="form-label">Author</label>
                    <input type="text" name="author" class="form-control border border-2 border-dark" id="productAuthor"/>
                </div>

                <div class="mb-3">
                    <label for="productDescription" class="form-label">Description</label>
                    <textarea name="description" class="form-control border border-2 border-dark" id="productDescription" rows="3"></textarea>
                </div>

                <div class="mb-3">
                    <label for="productPrice" class="form-label">Price</label>
                    <input type="number" name="price" min="0" step="0.01" class="form-control border border-2 border-dark"
                        id="productPrice"/>
                </div>

                <div class="mb-3">
                    <label for="productGenre" class="form-label">Genre</label>
                    <input type="text" name="genre" class="form-control border border-2 border-dark" id="productGenre"/>
                </div>

                <div class="mb-3">
                    <label for="productLanguage" class="form-label">Language</label>
                    <input type="text" name="language" class="form-control border border-2 border-dark" id="productLanguage"/>
                </div>

                <div class="mb-3">
                    <label for="productInStock" class="form-label">In Stock</label>
                    <input type="text" name="in_stock" class="form-control border border-2 border-dark" id="in_stock"/>
                </div>

                <button type="submit" class="btn btn-success mt-4 w-100" id="saveProductBtn">
                    Save <i class="fas fa-save ms-2"></i>
                </button>
            </form>
        </div>
    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/sort.js"></script>
    <script src="/js/admin-product.js"></script>
</body>

</html>