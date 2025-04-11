<!-- all-products.html -->

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
    @include('header')

    <!-- Main Content -->
    <main class="container flex-fill mt-5 pt-4 pb-5">

        <hr>

        <div class="d-flex flex-wrap justify-content-between align-items-center mb-2">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mt-0 col-12 col-md-auto">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="index.html" class="text-decoration-none text-dark">
                            <i class="bi bi-house-door-fill"></i> Home
                        </a>
                    </li>
                    <li class="breadcrumb-item active text-muted" aria-current="page">
                        All Books
                    </li>
                </ol>
            </nav>

            <!-- Ordering -->
            <div class="d-flex align-items-center col-12 col-md-auto mt-2 mt-md-0">
                <h5 class="fw-bold me-2 mb-0">Order by</h5>
                <select class="form-select w-auto" id="sortSelect", name="sortOption" onchange="updateSort()">
                <option value="price-asc" {{ request('sortOption') == 'price-asc' ? 'selected' : '' }}>Price: Low to High</option>
                <option value="price-desc" {{ request('sortOption') == 'price-desc' ? 'selected' : '' }}>Price: High to Low</option>
                <option value="bestsellers" {{ request('sortOption') == 'bestsellers' ? 'selected' : '' }}>Bestsellers</option>
                <option value="newest" {{ request('sortOption') == 'newest' ? 'selected' : '' }}>Newest</option>
                </select>
            </div>
        </div>


        <div class="row">
            <!-- Filters -->

            <aside class="col-md-3 pe-5">
                <h3 class="fw-bold">Filters</h3>
                <form method="GET" action="{{ route('allProducts') }}">

                    <!-- Price -->
                    <div class="mb-3">
                        <div class="d-flex align-items-center">
                            <h5 class="fw-bold mb-0">Price</h5>
                            <button type="button" class="btn btn-link border-0 p-0 ms-2 text-dark toggle-filter"
                                data-target="priceFilter">
                                <i class="bi bi-chevron-down"></i>
                            </button>
                        </div>

                        <div id="priceFilter" class="mt-2" style="display: none;">
                            <div id="priceSlider"></div>
                            <div class="d-flex justify-content-between mt-2">
                                <span id="priceMinLabel">value="{{ request('priceMin', 3) }}€</span>
                                <span id="priceMaxLabel">value="{{ request('priceMax', 42) }}€</span>
                            </div>
                        </div>

                        <input type="hidden" name="priceMin" id="priceMinInput" value="{{ request('priceMin', 3) }}">
                        <input type="hidden" name="priceMax" id="priceMaxInput" value="{{ request('priceMax', 42) }}">
                    </div>

                    <!-- Genre -->
                    <div class="mb-3">
                        <div class="d-flex align-items-center">
                            <h5 class="fw-bold mb-0">Genre</h5>
                            <button type="button" class="btn btn-link border-0 p-0 ms-2 text-dark toggle-filter"
                                data-target="genreFilters">
                                <i class="bi bi-chevron-down"></i>
                            </button>
                        </div>

                        <div id="genreFilters" class="mt-2" style="display: none;">
                            <div class="form-check">
                                <input class="form-check-input" name="genre[]" type="checkbox" id="genre1" value = "Science Fiction"
                                @checked(in_array(trim('Science Fiction'), $selectedGenres))>
                                <label class="form-check-label" for="genre1">Science Fiction</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" name="genre[]" type="checkbox" id="genre2" value = "Classic"
                                @checked(in_array('Classic', $selectedGenres))>
                                <label class="form-check-label" for="genre2">Classic</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" name="genre[]" type="checkbox" id="genre3" value = "Horror"
                                @checked(in_array('Horror', $selectedGenres))>
                                <label class="form-check-label" for="genre3">Horror</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" name="genre[]" type="checkbox" id="genre4" value = "Detective"
                                @checked(in_array('Detective', $selectedGenres))>
                                <label class="form-check-label" for="genre4">Detective</label>
                            </div>
                        </div>
                    </div>

                    <!-- Language -->
                    
                        <div class="mb-3">
                            <div class="d-flex align-items-center">
                                <h5 class="fw-bold mb-0">Language</h5>
                                <button type="button" class="btn btn-link border-0 p-0 ms-2 text-dark toggle-filter" type="button" data-target="languageFilters">
                                    <i class="bi bi-chevron-down"></i>
                                </button>
                            </div>

                            <div id="languageFilters" class="mt-2" style="display: none;">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="language[]" value="English" id="language1"
                                    @checked(in_array('English', $selectedLanguages))>
                                    <label class="form-check-label" for="language1">English</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="language[]" value="Slovak" id="language2"
                                    @checked(in_array('Slovak', $selectedLanguages))>
                                    <label class="form-check-label" for="language2">Slovak</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="language[]" value="Russian" id="language3"
                                    @checked(in_array('Russian', $selectedLanguages))>
                                    <label class="form-check-label" for="language3">Russian</label>
                                </div>
                            </div>
                        </div>
                    

                    <!-- Author -->
                    <div class="mb-3">
                        <div class="d-flex align-items-center">
                            <h5 class="fw-bold mb-0">Author</h5>
                            <button type="button" class="btn btn-link border-0 p-0 ms-2 text-dark toggle-filter"
                                data-target="authorFilters">
                                <i class="bi bi-chevron-down"></i>
                            </button>
                        </div>

                        <div id="authorFilters" class="mt-2" style="display: none;">
                            <div class="form-check">
                                <input class="form-check-input" name="author[]" type="checkbox" id="author1" value="Philip K. Dick"
                                @checked(in_array(trim('Philip K. Dick'), $selectedAuthors))>
                                <label class="form-check-label" for="author1">Philip K. Dick</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" name="author[]" type="checkbox" id="author6" value="Jozef Karika"
                                @checked(in_array(trim('Jozef Karika'), $selectedAuthors))>
                                <label class="form-check-label" for="author6">Jozef Karika</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" name="author[]" type="checkbox" id="author7" value="Dominik Dan"
                                @checked(in_array(trim('Dominik Dan'), $selectedAuthors))>
                                <label class="form-check-label" for="author7">Dominik Dan</label>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-2">Filter</button>
                </form>
                <a href="{{ route('allProducts') }}" class="btn btn-primary mt-2">Clear Filters</a>
            </aside>

            <!-- Main second container -->
            <section class="col-md-9 mb-5">

                <!-- All Products -->
                <div id="products" class="mb-5">

                    <div class="row row-cols-1 row-cols-md-2 g4">
                    @foreach($products as $product)
                    <div class="col mb-3">
                        <a href="{{ route('show.product', ['id' => $product->id]) }}" class="text-decoration-none text-dark">
                            <div class="card border-0 shadow-sm d-flex flex-row align-items-stretch p-3">
                                <img src="{{ $product->image }}" class="img-fluid rounded" style="width: 220px; height: auto;" alt="{{ $product->title }}">
                                <div class="card-body d-flex flex-column justify-content-between p-3">
                                    <div>
                                        <h5 class="text-start text-primary fw-bold text-truncate mb-1" style="max-width: 200px;">
                                            {{ $product->title }}
                                        </h5>
                                        <p class="text-start text-dark text-truncate mb-1">{{ $product->author }}</p>
                                        <p class="text-start text-muted text-truncate mb-3">Language: {{ $product->language }}</p>
                                        <p class="text-start text-muted text-truncate mb-3">Genre: {{ $product->genre }}</p>
                                    </div>
                                    <p class="text-start text-secondary text-truncate fw-bold mb-0">{{ $product->price }} €</p>
                                </div>
                            </div>
                        </a>
                    </div>      
                    @endforeach
                    
                    </div>
                    <div class="d-flex justify-content-center mt-4">
                        <ul class="pagination">
                            <!-- First page link -->
                            <li class="page-item {{ $products->onFirstPage() ? 'disabled' : '' }}">
                                <a class="page-link text-start text-secondary" href="{{ $products->url(1) }}">First</a>
                            </li>

                            <!-- Page range -->
                            @foreach ($products->getUrlRange($products->currentPage()-2, $products->currentPage()+2) as $page => $url)
                                @if ($page >= 1 && $page <= $products->lastPage())
                                    <li class="page-item {{ $products->currentPage() == $page ? 'active' : '' }}">
                                        <a class="page-link text-start text-secondary" href="{{ $url }}">{{ $page }}</a>
                                    </li>
                                @endif
                            @endforeach

                            <li class="page-item {{ $products->currentPage() == $products->lastPage() ? 'disabled' : '' }}">
                                <a class="page-link text-start text-secondary" href="{{ $products->url($products->lastPage()) }}">Last</a>
                            </li>
                        </ul>
                    </div>

                </div>

                <!-- Paging -->
                <!-- <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link text-primary" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link text-primary" href="#">Next</a></li>
                    </ul>
                </nav> -->

            </section>
        </div>
    </main>

    <!-- Footer -->
    @include('footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/sort.js"></script>
    <!-- <script src="/js/all-books.js"></script> -->
</body>

</html>