{{-- components/vertical-card.blade.php --}}

<!-- Article -->
<article class="list-inline-item me-4 p-2">
    <a href="{{ route('show.product', ['id' => $product->id]) }}" class="text-decoration-none text-dark">

        <!-- Card -->
        <div class="card border-0 shadow-sm" style="width: 255px;">

            <!-- Body -->
            <div class="card-body p-3 text-center">

                <!-- Image -->
                <img src="{{ $product->image }}" class="img-fluid rounded mx-auto d-block mb-2" style="max-width: 225px;" alt="{{ $product->title }}">

                <!-- Title -->    
                <h6 class="text-start text-primary fw-bold mb-1 text-truncate" style="max-width: 220px;">
                    {{ $product->title }}
                </h6>
                
                <!-- Autor -->
                <p class="text-start text-dark text-truncate mb-1">{{ $product->author }}</p>

                <!-- Price -->
                <p class="text-start text-secondary text-truncate fw-bold mb-0">{{ number_format($product->price, 2) }}€</p>
            </div>
            
        </div>

    </a>
</article>
