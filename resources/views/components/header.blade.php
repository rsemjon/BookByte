{{-- components/header.blade.php --}}

<!-- Header -->
<header>

  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"/>
  
  <!-- Nav -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">

      <!-- Logo -->
      <a class="navbar-brand" href="{{ route('home') }}">
        <img src="/images/logos/8.png" alt="Logo" height="40">
      </a>

      <!-- Burger -->
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
  
      <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
      
        <!-- Left Part -->
        <ul class="navbar-nav">

          <!-- Newest -->
          <li class="nav-item">
            <a class="nav-link text-light" href="{{ route('allProducts', ['sortOption' => 'newest']) }}">Newest</a>
          </li>

          <!-- Bestsellers -->
          <li class="nav-item">
            <a class="nav-link text-light" href="{{ route('allProducts', ['sortOption' => 'bestsellers']) }}">Bestsellers</a>
          </li>

          <!-- All Books -->
          <li class="nav-item">
            <a class="nav-link text-light" href="{{ route('allProducts') }}">All Books</a>
          </li>

        </ul>
  
        <!-- Right Part -->
        <div class="d-flex align-items-center">
  
          <!-- Search -->
          <form method="GET" action="{{ route('allProducts') }}">
              <!-- Loop through query parameters except 'searched_value' and 'page' -->
              @foreach(request()->except(['searched_value', 'page']) as $key => $value)
                  @if(is_array($value))
                      @foreach($value as $item)
                          <input type="hidden" name="{{ $key }}[]" value="{{ $item }}">
                      @endforeach
                  @else
                      <input type="hidden" name="{{ $key }}" value="{{ $value }}">
                  @endif
              @endforeach
  
              <div class="input-group">
                  <input type="text" name="searched_value" class="form-control" placeholder="Search..." value="{{ request('searched_value') }}"/>
                  <button class="btn btn-outline-light me-3" type="submit">
                      <i class="fas fa-search text-light"></i>
                  </button>
              </div>
          </form>
  
          <!-- Profile -->
          <a href="{{ route('profile') }}" class="nav-link text-white me-3">
            <i class="fas fa-user fa-2x"></i>
          </a>
  
          <!-- Shopping Cart -->
          <a href="{{ route('cart') }}" class="nav-link text-white">
            <i class="fas fa-shopping-cart fa-2x text-white"></i>
          </a>

        </div>

      </div>

    </div>
  </nav>

</header>