<!-- admin-page.html -->

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
                    <li class="breadcrumb-item">
                        <a href="all-products.html" class="text-decoration-none text-dark">All Books</a>
                    </li>
                    <li class="breadcrumb-item" id="bookTitleBreadcrumb">{{ $product->title }}</li>
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

            <div id="imagePreview" class="d-flex flex-wrap gap-3 mb-4">
                <div class="container my-4">
                    <h4 class="mb-3">Gallery</h4>
                     <div class="d-flex overflow-auto gap-3 p-2 border rounded" style="white-space: nowrap;">
                        @foreach($photosUrls as $url)
                            <div class="photo-container position-relative flex-shrink-0" style="width: 300px;">
                                <img src="/{{ $url }}" alt="{{ $url }}" class="img-thumbnail" style="width: 100%; height: auto;">
                                <form action="{{ route('delete.photo', ['id' => $product->id]) }}" method="POST" class="position-absolute top-50 start-50 translate-middle">
                                    @csrf
                                    @method('DELETE') 
                                    <input type="hidden" name="image_path" value="{{ $url }}">
                                    <button type="submit" class="btn btn-primary photo-button position-absolute top-50 start-50 translate-middle">
                                        Delete
                                    </button>
                                </form>
                            </div>
                        @endforeach
                    </div> 
                        
                    <style>
                        .photo-container .photo-button {
                            opacity: 0 !important;
                            transition: opacity 0.3s ease !important;
                            background-color: #dc3545 !important; /* Bootstrap "danger" red */
                            border-color: #dc3545 !important;
                            color: #fff !important;
                        }
                        .photo-container:hover .photo-button {
                            opacity: 1 !important;
                        }
                        .photo-container .photo-button:hover {
                            background-color: #dc3545 !important;
                            border-color: #dc3545 !important;
                            color: #fff !important;
                        }
                    </style>

                </div>
            </div>
            

            <!-- Hidden file input -->
            <input type="file" id="hiddenImageInput" accept="image/*" multiple style="display: none;" />

            <!-- Product Form -->
            <form class="w-100" id="productForm" action="{{ route('update.product', $product->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT') 


                <!-- <div class="d-flex overflow-auto gap-3 p-2 border rounded" style="white-space: nowrap;">
                @foreach($photosUrls as $url)
                    <div class="photo-container position-relative flex-shrink-0" style="width: 300px;">
                        <img src="/{{ $url }}" alt="{{ $url }}" class="img-thumbnail" style="width: 100%; height: auto;">
                        
                        <button class="btn btn-primary photo-button position-absolute top-50 start-50 translate-middle">
                            Action
                        </button>
                    </div>
                @endforeach
                </div> -->

                
            
<!-- 
            <style>
                .photo-container .photo-button {
                    opacity: 0 !important;
                    transition: opacity 0.3s ease !important;
                    background-color: #dc3545 !important; /* Bootstrap "danger" red */
                    border-color: #dc3545 !important;
                    color: #fff !important;
                }
                .photo-container:hover .photo-button {
                    opacity: 1 !important;
                }
                .photo-container .photo-button:hover {
                    background-color: #dc3545 !important;
                    border-color: #dc3545 !important;
                    color: #fff !important;
                }
            </style> -->
               

                <div class="mb-3">
                <input type="file" name="photos[]" class="form-control border border-2 border-dark" id="productPhotos" multiple />
                </div>

                <div class="mb-3">
                    <label for="productTitle" class="form-label">Title</label>
                    <input type="text" name="title" class="form-control border border-2 border-dark" id="productTitle" value="{{ old('title', $product->title) }}" />
                </div>

                <div class="mb-3">
                    <label for="productAuthor" class="form-label">Author</label>
                    <input type="text" name="author" class="form-control border border-2 border-dark" id="productAuthor" value="{{ old('author', $product->author) }}"/>
                </div>

                <div class="mb-3">
                    <label for="productDescription" class="form-label">Description</label>
                    <textarea name="description" class="form-control border border-2 border-dark" id="productDescription" rows="3">{{ old('description', $product->description) }}</textarea>
                </div>

                <div class="mb-3">
                    <label for="productPrice" class="form-label">Price</label>
                    <input type="number" name="price" min="0" step="0.01" class="form-control border border-2 border-dark"
                        id="productPrice" value="{{ old('price', $product->price) }}"/>
                </div>

                <div class="mb-3">
                    <label for="productGenre" class="form-label">Genre</label>
                    <input type="text" name="genre" class="form-control border border-2 border-dark" id="productGenre" value="{{ old('genre', $product->genre) }}"/>
                </div>

                <div class="mb-3">
                    <label for="productLanguage" class="form-label">Language</label>
                    <input type="text" name="language" class="form-control border border-2 border-dark" id="productLanguage" value="{{ old('language', $product->language) }}"/>
                </div>

                <div class="mb-3">
                    <label for="productInStock" class="form-label">In Stock</label>
                    <input type="text" name="in_stock" class="form-control border border-2 border-dark" id="in_stock" value="{{ old('in_stock', $product->in_stock) }}"/>
                </div>

                <button type="submit" class="btn btn-success mt-4 w-100" id="saveProductBtn">
                    Save <i class="fas fa-save ms-2"></i>
                </button>

                <button type="button" class="btn btn-danger mt-4 w-100" id="deleteProductBtn">
                    Delete <i class="fas fa-trash ms-2"></i>
                </button>
            </form>
        </div>
    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/sort.js"></script>
</body>

</html>