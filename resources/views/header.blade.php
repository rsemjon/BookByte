<!-- header.html -->
 
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
  rel="stylesheet"
/>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.html">
      <img src="/images/logos/8.png" alt="Logo" height="40">
    </a>

    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarNav"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
      <!-- Left Part -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-light" href="all-products.html?sort=newest">Newest</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="all-products.html?sort=bestsellers">Bestsellers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="all-products.html">All Books</a>
        </li>
      </ul>

      <!-- Right Part -->
      <div class="d-flex align-items-center">

        <!-- Search -->
        <form class="d-flex me-3">
          <div class="input-group">
            <input
              type="text"
              class="form-control"
              placeholder="Search..."
            />
            <button class="btn btn-outline-light" type="button">
              <i class="fas fa-search text-light"></i>
            </button>
          </div>
        </form>

        <!-- Profile -->
        <a href="{{ route('profile') }}" class="nav-link text-white me-3">
          <i class="fas fa-user fa-2x"></i>
        </a>

        <!-- Shopping Cart -->
        <a href="shopping-cart.html" class="nav-link text-white">
          <i class="fas fa-shopping-cart fa-2x"></i>
        </a>

      </div>
    </div>
  </div>
</nav>
