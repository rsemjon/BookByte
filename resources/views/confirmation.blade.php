{{-- components/confirmation.blade.php --}}

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Confirmation</title>
    <link rel="icon" href="/images/icons/icon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    @include('components.header')

    <!-- Main -->
    <main class="container flex-fill mt-5 pt-4 pb-5 mb-5">

        <hr>

        <!-- Nav -->
        <nav aria-label="breadcrumb">

            <!-- Breadcrumbs -->
            <ol class="breadcrumb">

                <!-- Shopping Cart -->
                <li class="breadcrumb-item">
                    <a href="{{ route('cart') }}" class="text-decoration-none text-dark">
                        <i class="fas fa-shopping-cart"></i> Shopping Cart
                    </a>
                </li>

                <!-- Delivery -->
                <li class="breadcrumb-item">
                    <a href="{{ route('delivery') }}" class="text-decoration-none text-dark">Delivery</a>
                </li>

                <!-- Payment -->
                <li class="breadcrumb-item">
                    <a href="{{ route('payment')  }}" class="text-decoration-none text-dark">Payment</a>
                </li>

                <!-- Confirmation -->
                <li class="breadcrumb-item active text-muted">Confirmation</li>

            </ol>

        </nav>

        <div class="row mt-4">
            
            <!-- Section -->
            <section class="rounded col-md-7 p-3 bg-light">

                <!-- Products -->
                @foreach ($products as $product)
                    @include('components.confirm-item', ['product'=>$product])
                @endforeach

            </section>

            <div class="col-md-5">

                <!-- Section -->
                <section class="rounded p-3 bg-light">

                    <!-- Delivery -->
                    <h4 class="fw-bold">Delivery</h4>

                    <div class="d-flex justify-content-between">
                        <p class="text-muted fw-bold text-truncate">{{ $deliveryLabel }}</p>
                        <p class="{{ $deliveryCost==0 ? 'text-muted' : 'text-secondary' }} fw-bold">
                            {{ $deliveryCost==0 ? 'No Charge' : number_format($deliveryCost,2).'€' }}
                        </p>
                    </div>

                </section>

                <!-- Section -->
                <section class="rounded p-3 mt-3 bg-light">

                    <!-- Payment -->
                    <h4 class="fw-bold">Payment</h4>

                    <div class="d-flex justify-content-between">
                        <p class="text-muted fw-bold text-truncate" style="max-width:60%">{{ $paymentLabel }}</p>
                        <p class="{{ $paymentCost==0 ? 'text-muted' : 'text-secondary' }} fw-bold">
                            {{ $paymentCost==0 ? 'No Charge' : number_format($paymentCost,2).'€' }}
                        </p>
                    </div>

                </section>

            </div>

        </div>

        <hr>

        <div class="d-flex justify-content-between">

            <!-- Total -->
            <span class="text-dark fw-bold fs-4">Total</span>

            <!-- Cost -->
            <span class="text-secondary fw-bold fs-4">
                {{ number_format($finalTotal, 2) }}€
            </span>

        </div>

        <form action="{{ route('confirmation.confirm') }}" method="POST" class="d-flex justify-content-end mt-3">

            @csrf

            <!-- Confirm Button -->
            <button type="submit" class="btn btn-primary px-4">Confirm</button>

        </form>

    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
