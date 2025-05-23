{{-- components/confirm-item.blade.php --}}

@props(['product'])

<!-- Article -->
<article class="d-flex align-items-center {{ $loop->last ? '' : 'mb-2' }} w-100 overflow-hidden">

    <!-- Image -->
    <img src="{{ $product->image }}" class="rounded me-3 flex-shrink-0" width="60" height="60" alt="{{ $product->title }}">
    
    <!-- Title -->
    <div class="me-auto overflow-hidden" style="max-width: 300px;">
        <span class="text-dark fw-bold text-truncate d-block" style="white-space: nowrap;"> 
            {{ $product->title }}
        </span>
    </div>

    <!-- Price -->
    <span class="text-secondary fw-bold flex-shrink-0">
        {{ number_format($product->price, 2) }} €
    </span>

    <!-- Quantity -->
    <span class="text-muted ms-2 flex-shrink-0" style="white-space: nowrap;">x {{ $product->pivot->quantity }}</span>

</article>
