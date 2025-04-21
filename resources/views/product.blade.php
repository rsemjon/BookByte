<!-- product.html -->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>{{ $product->title }}</title>
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>

<body class="d-flex flex-column min-vh-100">
    @if (session('success'))
        @include('components.alert', ['message' => session('success')])
    @endif

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
                        <a href="{{ route('allProducts') }}" class="text-decoration-none text-dark">All Books</a>
                    </li>
        
                    <li class="breadcrumb-item active text-muted" id="bookTitleBreadcrumb" aria-current="page">
                        {{ $product->title }}
                    </li>
                </ol>
        </nav>

        </div>

        <div class="container pt-3">
            <div class="row align-items-center">

                <!-- Image Carousel -->
                <div class="col-md-4 text-center">
                    <div id="productCarousel" class="carousel slide" data-bs-ride="carousel" >
                        <div class="carousel-inner">
                        @foreach($photosUrls as $index => $photoUrl)
                            <div class="carousel-item {{ $index === 0 ? 'active' : '' }}">
                                <img src="{{ asset($photoUrl) }}" id="bookImage" class="img-fluid w-100 rounded shadow-sm" alt="Book presentation image">
                            </div>
                        @endforeach

                        </div>
                        
                        <!-- Navigation -->
                        <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true" style="filter: invert(1);"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#productCarousel"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true" style="filter: invert(1);"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>

                <div class="col-md-8">
                    <!-- Book -->
                    <h2 class="text-dark fw-bold" id="bookTitle">{{ $product->title }}</h2>

                    <!-- Author -->
                    <h5 class="text-primary" id="bookAuthor">{{ $product->author }}</h5>

                    <!-- Tags -->
                    <div class="d-flex flex-wrap mt-2">
                        <span class="badge bg-info me-2 fs-6 p-2" id="bookGenre">{{ $product->genre }}</span>
                        <span class="badge bg-info fs-6 p-2" id="bookLanguage">{{ $product->language }}</span>
                    </div>
                    
                    <hr>

                    <!-- Description -->
                    <p class="text-muted" id="bookDescription">{{ $product->description }}</p>

                    <ul class="list-inline mt-5 pt-4 d-flex flex-row flex-wrap align-items-center justify-content-start text-center gap-3">

                        <!-- Price -->
                        <li class="list-inline-item">
                            <h3 class="text-secondary fw-bold mb-0" id="bookPrice">{{ $product->price }}</h3>
                        </li>

                        <!-- In Stocks -->
                        <li class="list-inline-item">
                            <h6 class="text-dark mb-0" id="bookStock">
                                In Stock {{ $product->in_stock > 10 ? '> 10' : $product->in_stock }} pcs
                            </h6>
                        </li>
                    
                        <!-- Add to Cart -->
                        <li class="list-inline-item">
                            <form action="{{ route('cart.add',$product) }}" method="POST" class="d-inline">
                                @csrf
                                <input type="hidden" name="qty" value="1">
                                <button class="btn btn-primary px-4 text-nowrap" style="min-width:170px;">
                                    Add to Cart <i class="fas fa-shopping-cart ms-2"></i>
                                </button>
                            </form>
                        </li>

                        <!-- Edit Product -->
                        @auth
                            @if(Auth::user()->role === 'admin')
                                <li class="list-inline-item">
                                    <a href="#" class="btn btn-primary px-4 d-inline-block text-nowrap" style="min-width: 170px;">
                                        Edit Product <i class="fas fa-edit ms-2"></i>
                                    </a>
                                </li>
                            @endif
                        @endauth
                    </ul>                                              
                </div>
            </div>
        </div>

    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>