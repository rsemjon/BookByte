{{-- components/all-products.blade.php --}}

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>All Products</title>
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.js"></script>
    <link rel="stylesheet" href="/css/custom.css">
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    @include('components.header')

    <!-- Main -->
    <main class="container flex-fill mt-5 pt-4 pb-5">

        <hr>

        <div class="d-flex flex-wrap justify-content-between align-items-center mb-2">
            
            <!-- Nav -->
            <nav aria-label="breadcrumb" class="mt-0 col-12 col-md-auto">

                <!-- Breadcrumbs -->
                <ol class="breadcrumb">

                    <!-- Home -->
                    <li class="breadcrumb-item">
                        <a href="{{ route('home') }}" class="text-decoration-none text-dark">
                            <i class="bi bi-house-door-fill"></i> Home
                        </a>
                    </li>

                    <!-- All Books -->
                    <li class="breadcrumb-item active text-muted" aria-current="page">
                        All Books
                    </li>

                </ol>
                
            </nav>

            <!-- Ordering -->
            <div class="d-flex align-items-center col-12 col-md-auto mt-2 mt-md-0">
                <h5 class="fw-bold me-2 mb-0">Order by</h5>
                <select class="form-select w-auto" id="sortSelect", name="sortOption" onchange="updateSort()">
                <option value="" disabled {{ request('sortOption') ? '' : 'selected' }}>Select...</option>
                <option value="bestsellers" {{ request('sortOption') == 'bestsellers' ? 'selected' : '' }}>Bestsellers</option>
                <option value="price-asc" {{ request('sortOption') == 'price-asc' ? 'selected' : '' }}>Price: Low to High</option>
                <option value="price-desc" {{ request('sortOption') == 'price-desc' ? 'selected' : '' }}>Price: High to Low</option>
                <option value="newest" {{ request('sortOption') == 'newest' ? 'selected' : '' }}>Newest</option>
                </select>
            </div>

        </div>

        <div class="row">
        
            <!-- Aside -->
            <aside class="col-md-3 pe-5">

                <!-- Filters -->
                <h3 class="fw-bold">Filters</h3>
                
                <form method="GET" action="{{ route('allProducts') }}">
                @if(request('searched_value'))
                    <input type="hidden" name="searched_value" value="{{ request('searched_value') }}">
                @endif

                    <!-- Price -->
                    <div class="mb-3">
                        <div class="d-flex align-items-center">
                            <h5 class="fw-bold mb-0">Price</h5>
                            <button type="button" class="btn btn-link border-0 p-0 ms-2 text-dark toggle-filter"
                                    data-target="priceFilter">
                                <i class="bi bi-chevron-down"></i>
                            </button>
                        </div>

                        <div id="priceFilter" class="mt-2" style="display:none;">
                            <div id="priceSlider"
                                data-min="{{ $minPrice }}"
                                data-max="{{ $maxPrice }}"></div>

                            <div class="d-flex justify-content-between mt-2">
                                <span id="priceMinLabel">{{ request('priceMin', $minPrice) }}€</span>
                                <span id="priceMaxLabel">{{ request('priceMax', $maxPrice) }}€</span>
                            </div>
                        </div>

                        <input type="hidden" name="priceMin" id="priceMinInput" value="{{ request('priceMin', $minPrice) }}">
                        <input type="hidden" name="priceMax" id="priceMaxInput" value="{{ request('priceMax', $maxPrice) }}">
                    </div>

                    <!-- Genre -->
                    <div class="mb-3">
                        <div class="d-flex align-items-center">
                            <h5 class="fw-bold mb-0">Genre</h5>
                            <button type="button" class="btn btn-link border-0 p-0 ms-2 text-dark toggle-filter" data-target="genreFilters">
                                <i class="bi bi-chevron-down"></i>
                            </button>
                        </div>

                        <div id="genreFilters" class="mt-2" style="display: none;">
                            @foreach($availableGenres as $genre)
                            <div class="form-check">
                                <input class="form-check-input" name="genre[]" type="checkbox" id="genre_{{ $loop->index }}" value="{{ $genre }}" @checked(in_array($genre, $selectedGenres))>
                                <label class="form-check-label" for="genre_{{ $loop->index }}">{{ $genre }}</label>
                            </div>
                            @endforeach
                        </div>
                    </div>

                    <!-- Language -->
                    <div class="mb-3">
                        <div class="d-flex align-items-center">
                            <h5 class="fw-bold mb-0">Language</h5>
                            <button type="button" class="btn btn-link border-0 p-0 ms-2 text-dark toggle-filter" data-target="languageFilters">
                                <i class="bi bi-chevron-down"></i>
                            </button>
                        </div>
                        <div id="languageFilters" class="mt-2" style="display: none;">
                            @foreach($availableLanguages as $lang)
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="language[]" value="{{ $lang }}" id="lang_{{ $loop->index }}" @checked(in_array($lang, $selectedLanguages))>
                                <label class="form-check-label" for="lang_{{ $loop->index }}">{{ $lang }}</label>
                            </div>
                            @endforeach
                        </div>
                    </div>

                    <!-- Cover Type -->
                    <div class="mb-3">
                        <div class="d-flex align-items-center">
                            <h5 class="fw-bold mb-0">Cover</h5>
                            <button type="button" class="btn btn-link border-0 p-0 ms-2 text-dark toggle-filter" data-target="coverFilters">
                                <i class="bi bi-chevron-down"></i>
                            </button>
                        </div>
                        <div id="coverFilters" class="mt-2" style="display: none;">
                            @foreach($availableCoverTypes as $cover)
                            <div class="form-check">
                                <input class="form-check-input" name="cover_type[]" type="checkbox" id="cover_{{ $loop->index }}" value="{{ $cover }}" @checked(in_array($cover, $selectedCoverTypes))>
                                <label class="form-check-label" for="cover_{{ $loop->index }}">{{ $cover }}</label>
                            </div>
                            @endforeach
                        </div>
                    </div>

                    <!-- Author -->
                    <div class="mb-3">
                        <div class="d-flex align-items-center">
                            <h5 class="fw-bold mb-0">Author</h5>
                            <button type="button" class="btn btn-link border-0 p-0 ms-2 text-dark toggle-filter" data-target="authorFilters">
                                <i class="bi bi-chevron-down"></i>
                            </button>
                        </div>
                        <div id="authorFilters" class="mt-2" style="display: none;">
                            @foreach($availableAuthors as $author)
                            <div class="form-check">
                                <input class="form-check-input" name="author[]" type="checkbox" id="author_{{ $loop->index }}" value="{{ $author }}" @checked(in_array($author, $selectedAuthors))>
                                <label class="form-check-label" for="author_{{ $loop->index }}">{{ $author }}</label>
                            </div>
                            @endforeach
                        </div>
                    </div>
                    
                    <!-- Action Buttons -->
                    <div class="d-grid gap-2">

                        <!-- Apply Filters -->
                        <button type="submit" class="btn btn-primary">Filter</button>

                        <!-- Clear Filters -->
                        <a href="{{ route('allProducts') }}" class="btn btn-outline-primary">Clear</a>

                    </div>

                </form>

            </aside>

            <!-- Section -->
            <section class="col-md-9 mb-5 d-flex flex-column">

                <!-- All Products -->
                <div id="products" class="flex-grow-1 mb-4 mt-4 mt-md-0">
                    @if ($products->isEmpty() && !(Auth::check() && Auth::user()->role==='admin'))
                        <div class="text-center mt-5">
                            <img src="{{ asset('images/mascots/products.png') }}" alt="Empty Products Mascot" style="max-width: 350px; width: 100%;">
                            <p class="text-dark fw-bold fs-5 mb-5">Oops, no products match your filters!</p>
                        </div>
                    @else
                        <div class="row row-cols-1 row-cols-md-2 g-4">
                            @auth
                                @if (Auth::user()->role === 'admin')

                                    <!-- Add Product Button -->
                                    <div class="col mb-3">
                                        <a href="{{ route('show.add.product') }}" class="text-decoration-none text-secondary">
                                            <div class="card border border-secondary border-2 shadow-sm d-flex flex-row align-items-center justify-content-center p-3 h-100" style="min-height:255px;"> 
                                                <i class="bi bi-plus-lg fs-1"></i>
                                            </div>
                                        </a>
                                    </div>
                                @endif
                            @endauth

                            <!-- Products -->
                            @foreach ($products as $product)
                                @include('components.horizontal-card', ['product' => $product])
                            @endforeach
                        </div>
                    @endif
                </div>

                <!-- Pagination -->
                <div class="d-flex justify-content-center mt-auto pt-3">
                    <ul class="pagination mb-0">

                        <!-- First page link -->
                        <li class="page-item {{ $products->onFirstPage() ? 'disabled' : '' }}">
                            <a class="page-link text-start text-secondary" href="{{ $products->appends(request()->query())->url(1) }}">First</a>
                        </li>

                        <!-- Page range -->
                        @foreach ($products->getUrlRange(
                            max(1, $products->currentPage()-2),
                            min($products->lastPage(), $products->currentPage()+2)
                        ) as $page => $dummy)
                            @php
                                $url = $products->appends(request()->query())->url($page);
                            @endphp
                            <li class="page-item {{ $products->currentPage() == $page ? 'active' : '' }}">
                                <a class="page-link {{ $products->currentPage() == $page ? 'bg-primary text-white border-primary' : 'text-secondary' }}" href="{{ $url }}">
                                    {{ $page }}
                                </a>
                            </li>
                        @endforeach

                        <li class="page-item {{ $products->currentPage() == $products->lastPage() ? 'disabled' : '' }}">
                            <a class="page-link text-start text-secondary" href="{{ $products->appends(request()->query())->url($products->lastPage()) }}">Last</a>
                        </li>

                    </ul>
                </div>

            </section>

        </div>
    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/sort.js"></script>
</body>

</html>