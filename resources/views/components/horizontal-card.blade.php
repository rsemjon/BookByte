{{-- components/horizontal-card.blade.php --}}

<!-- Article -->
<article class="col mb-3">
    <a href="{{ route('show.product', ['id' => $product->id]) }}" class="text-decoration-none text-dark">

        <!-- Card -->
        <div class="card border-0 shadow-sm d-flex flex-row align-items-stretch p-3">

            <!-- Image -->
            <img src="{{ $product->image }}" class="img-fluid rounded" style="width: 220px; height: auto;" alt="{{ $product->title }}">

            <!-- Body -->
            <div class="card-body d-flex flex-column justify-content-between p-3">

                <!-- Top -->
                <div>

                    <!-- Title -->
                    <h5 class="text-start text-primary fw-bold text-truncate mb-1" style="max-width: 200px;">
                        {{ $product->title }}
                    </h5>

                    <!-- Autor -->
                    <p class="text-start text-dark text-truncate mb-1">{{ $product->author }}</p>

                </div>

                <!-- Price -->
                <p class="text-start text-secondary text-truncate fw-bold mb-0">{{ $product->price }} €</p>
            </div>

        </div>
        
    </a>
</article>