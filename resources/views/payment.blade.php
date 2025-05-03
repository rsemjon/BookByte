{{-- components/payment.blade.php --}}

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Payment</title>
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
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
                        <i class="fas fa-shopping-cart"></i> Shopping Cart
                    </a>
                </li>

                <!-- Delivery -->
                <li class="breadcrumb-item">
                    <a href="{{ route('delivery') }}" class="text-decoration-none text-dark">Delivery</a>
                </li>

                <!-- Payment -->
                <li class="breadcrumb-item active text-muted" aria-current="page">Payment</li>

            </ol>

        </nav>

        <form method="POST" action="{{ route('payment.store') }}">

            @csrf

            <div class="list-group">

                <!-- Card -->
                <label class="list-group-item d-flex justify-content-between align-items-center fs-5 py-3">

                    <div class="d-flex align-items-center">
                        <input type="radio" name="paymentMethod" class="form-check-input me-3" value="CREDIT_CARD" {{ old('paymentMethod', $order->payment_method ?? '') === 'CREDIT_CARD' ? 'checked' : '' }}>
                        Card
                    </div>

                    <!-- Price -->
                    <span class="text-muted fw-bold fs-6">No Charge</span>
                </label>

                <!-- Cash -->
                <label class="list-group-item d-flex justify-content-between align-items-center fs-5 py-3">

                    <div class="d-flex align-items-center">
                        <input type="radio" name="paymentMethod" class="form-check-input me-3" value="CASH" {{ old('paymentMethod', $order->payment_method ?? '') === 'CASH' ? 'checked' : '' }}>
                        Cash (On Delivery)
                    </div>

                    <!-- Price -->
                    <span class="text-secondary fw-bold fs-6">1.50 €</span>
                </label>

                <!-- Online -->
                <label class="list-group-item d-flex justify-content-between align-items-center fs-5 py-3">

                    <div class="d-flex align-items-center">
                        <input type="radio" name="paymentMethod" class="form-check-input me-3" value="ONLINE_PAYMENT" {{ old('paymentMethod', $order->payment_method ?? '') === 'ONLINE_PAYMENT' ? 'checked' : '' }}>
                        Online Payment
                    </div>

                    <div class="d-flex flex-wrap justify-content-end gap-2">

                        <!-- Google Pay -->
                        <span class="text-muted fw-bold fs-6 d-flex align-items-center">
                            <i class="bi bi-google me-1"></i> Pay
                        </span>

                        <!-- Apple Pay -->
                        <span class="text-muted fw-bold fs-6 d-flex align-items-center">
                            <i class="bi bi-apple me-1"></i> Pay
                        </span>

                        <!-- Price -->
                        <span class="text-muted fw-bold fs-6">No Charge</span>
                    </div>

                </label>

            </div>

            <!-- Continue Button -->
            <div class="text-end mt-4">
                <button class="btn btn-primary px-4">Continue</button>
            </div>

        </form>

    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>