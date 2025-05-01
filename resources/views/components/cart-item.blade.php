{{-- components/card-item.blade.php --}}

<!-- Article -->
<article id="row-{{ $p->id }}" class="d-flex align-items-center p-3 w-100 overflow-hidden">

    <!-- Image -->
    <a href="{{ route('show.product', ['id' => $p->id]) }}" class="flex-shrink-0">
        <img src="{{ $p->image }}" width="80" height="80" class="rounded me-3" alt="{{ $p->title }}">
    </a>

    <div class="me-auto overflow-hidden">

        <!-- Title -->
        <a href="{{ route('show.product', ['id' => $p->id]) }}" class="text-decoration-none text-primary fw-bold d-inline-block text-truncate" style="max-width:300px">
            {{ $p->title }}
        </a>

        <!-- In Stock -->
        <div class="text-muted">
            In Stock {{ $p->in_stock > 10 ? '> 10' : $p->in_stock }} pcs
        </div>
    </div>

    <!-- Change Quantity -->
    <div class="d-flex align-items-center flex-shrink-0" style="min-width: 120px;">

        <!-- Minus Button -->
        <button class="btn btn-sm fw-bold d-flex justify-content-center align-items-center" style="width: 34px; height: 34px;" onclick="changeQty({{ $p->id }}, -1)">−</button>

        <!-- Quantity -->
        <span id="qty-{{ $p->id }}" data-max-qty="{{ $p->in_stock }}" class="px-2 text-center d-inline-block" style="min-width: 40px;">
            {{ $p->qty }}
        </span>

        <!-- Plus Button -->
        <button id="plus-{{ $p->id }}" class="btn btn-sm fw-bold d-flex justify-content-center align-items-center" style="width:34px; height:34px;" onclick="changeQty({{ $p->id }}, 1)">+</button>

    </div>

    <!-- Remove Button -->
    <button class="btn btn-outline-danger btn-sm ms-3 flex-shrink-0 d-flex justify-content-center align-items-center" style="width: 34px; height: 34px;" onclick="removeItem({{ $p->id }})">
        <i class="fas fa-times"></i>
    </button>

    <!-- Price -->
    <div class="ms-3 flex-shrink-0 text-end" style="min-width: 65px;">
        <span class="text-secondary fw-bold price" data-price="{{ $p->price }}">
            {{ number_format($p->price, 2) }}€
        </span>
    </div>

</article>