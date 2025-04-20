<!-- shopping-cart.html -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body class="d-flex flex-column min-vh-100">
    @include('components.header')

    <main class="container flex-fill mt-5 pt-4 pb-5 mb-5">
        <hr>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb"><li class="breadcrumb-item active text-muted">
                <i class="fas fa-shopping-cart"></i> Shopping Cart</li></ol>
        </nav>

        @if($items->isEmpty())
            <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 110px;">
                <img src="{{ asset('images/mascots/cart.png') }}" alt="Empty Cart Mascot" class="w-25">
                <p class="text-dark fw-bold fs-5 mb-5">Oops, your cart is empty!</p>
            </div>
        @else
            @foreach($items as $p)
                @include('components.cart-item', ['p' => $p])
            @endforeach
            <hr>
            <div class="d-flex justify-content-between">
                <span class="text-dark fw-bold fs-4">Total</span>
                <span id="total-price" class="text-secondary fw-bold fs-4">
                    {{ number_format($total ?? 0, 2) }}€
                </span>
            </div>

            <div class="text-end mt-3">
                <a href="{{ route('delivery') }}" class="btn btn-primary px-4">Continue</a>
            </div>
        @endif

    </main>

    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        window.csrfToken = '{{ csrf_token() }}';
        window.cartUpdateUrl = '{{ url("/cart/update/:id") }}';
        window.cartRemoveUrl = '{{ url("/cart/remove/:id") }}';
    </script>
    <script src="{{ asset('js/cart.js') }}"></script>
</body>
</html>
