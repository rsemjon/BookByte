{{-- components/delivery.blade.php --}}

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Delivery</title>
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
                <li class="breadcrumb-item"><a href="{{ route('cart') }}" class="text-decoration-none text-dark">
                    <i class="fas fa-shopping-cart"></i> Shopping Cart</a>
                </li>

                <!-- Delivery -->
                <li class="breadcrumb-item active text-muted">Delivery</li>

            </ol>

        </nav>

        <form method="POST" action="{{ route('delivery.store') }}">

            @csrf

            <div class="list-group">
                
                <!-- Section -->
                <section>

                    <!-- Home Delivery -->
                    <label class="list-group-item rounded-top d-flex justify-content-between align-items-center fs-5 py-3" data-bs-toggle="collapse" data-bs-target="#address_info">
                        <div class="d-flex align-items-center">
                            <input type="radio" name="deliveryMethod" class="form-check-input me-3" value="HOME" {{ old('deliveryMethod', $order->delivery_method ?? '') === 'HOME' ? 'checked' : '' }}>
                            Home Delivery (FedEx)
                        </div>
                        <span class="text-secondary fw-bold fs-6">3.50€</span>
                    </label>
    
                    <!-- Collapsible Section -->
                    <div id="address_info" class="collapse p-3">
    
                        <!-- Personal Info -->
                        <label class="form-label">First name</label>
                        <input name="first_name_home" type="text" class="form-control mb-2" placeholder="Enter your first name" value="{{ old('first_name_home', $order->first_name ?? '') }}">
    
                        <label class="form-label">Last name</label>
                        <input name="last_name_home" type="text" class="form-control mb-2" placeholder="Enter your last name" value="{{ old('last_name_home', $order->last_name ?? '') }}">
    
                        <label class="form-label">Phone number</label>
                        <input name="phone_number_home" type="text" class="form-control mb-2" placeholder="Enter your phone number" value="{{ old('phone_number_home', $order->phone_number ?? '') }}">
    
                        <label class="form-label">Email address</label>
                        <input name="email_address_home" type="email" class="form-control mb-2" placeholder="Enter your email address" value="{{ old('email_address_home', $order->email_address ?? '') }}">
    
                        <!-- Address Info -->
                        <label class="form-label">Delivery Address</label>
                        <input name="address" type="text" class="form-control mb-2" placeholder="Enter your adress" value="{{ old('address', $order->address ?? '') }}">
    
                        <label class="form-label">City</label>
                        <input name="city" type="text" class="form-control mb-2" placeholder="Enter your city" value="{{ old('city', $order->city ?? '') }}">
    
                        <label class="form-label">Postal Code</label>
                        <input name="postal_code" type="text" class="form-control" placeholder="Enter your postal code" value="{{ old('postal_code', $order->postal_code ?? '') }}">
    
                    </div>

                </section>

                <!-- Section -->
                <section>

                    <!-- Drop Box -->
                    <label class="list-group-item d-flex justify-content-between align-items-center fs-5 py-3" data-bs-toggle="collapse" data-bs-target="#drop_box_locations">
                        <div class="d-flex align-items-center">
                            <input type="radio" name="deliveryMethod" class="form-check-input me-3" value="DROP_BOX" {{ old('deliveryMethod', $order->delivery_method ?? '') === 'DROP_BOX' ? 'checked' : '' }}>
                            Drop Box (Alza)
                        </div>
                        <span class="text-secondary fw-bold fs-6">1.80€</span>
                    </label>

                    <!-- Collapsible Section -->
                    <div id="drop_box_locations" class="collapse p-3">

                        <!-- Personal Info -->
                        <label class="form-label">First name</label>
                        <input name="first_name_dropbox" type="text" class="form-control mb-2" placeholder="Enter your first name" value="{{ old('first_name_dropbox', $order->first_name ?? '') }}">

                        <label class="form-label">Last name</label>
                        <input name="last_name_dropbox" type="text" class="form-control mb-2" placeholder="Enter your last name" value="{{ old('last_name_dropbox', $order->last_name ?? '') }}">

                        <label class="form-label">Phone number</label>
                        <input name="phone_number_dropbox" type="text" class="form-control mb-2" placeholder="Enter your phone number" value="{{ old('phone_number_dropbox', $order->phone_number ?? '') }}">

                        <label class="form-label">Email address</label>
                        <input name="email_address_dropbox" type="email" class="form-control mb-2" placeholder="Enter your email address" value="{{ old('email_address_dropbox', $order->email_address ?? '') }}">

                        <!-- Drop Boxes -->
                        <label for="address" class="form-label">Available Drop Boxes</label>
                        @foreach($dropBoxes as $box)
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="dropBox" value="{{ $box }}" {{ old('dropBox', $selectedDropBox ?? '') === $box ? 'checked' : '' }}>
                                <label class="form-check-label">{{ $box }}</label>
                            </div>
                        @endforeach

                    </div>

                </section>

                <!-- Section -->
                <section>

                    <!-- Store Pickup -->
                    <label class="list-group-item rounded-bottom d-flex justify-content-between align-items-center fs-5 py-3" data-bs-toggle="collapse" data-bs-target="#store_pickup_locations">
                        <div class="d-flex align-items-center">
                            <input type="radio" name="deliveryMethod" class="form-check-input me-3" value="STORE" {{ old('deliveryMethod', $order->delivery_method ?? '') === 'STORE' ? 'checked' : '' }}>
                            In-Store Pickup
                        </div>
                        <span class="text-muted fw-bold fs-6">No Charge</span>
                    </label>

                    <!-- Collapsible Section -->
                    <div id="store_pickup_locations" class="collapse p-3">

                        <!-- Personal Info -->
                        <label class="form-label">First name</label>
                        <input name="first_name_store" type="text" class="form-control mb-2" placeholder="Enter your first name" value="{{ old('first_name_store', $order->first_name ?? '') }}">

                        <label class="form-label">Last name</label>
                        <input name="last_name_store" type="text" class="form-control mb-2" placeholder="Enter your last name" value="{{ old('last_name_store', $order->last_name ?? '') }}">

                        <label class="form-label">Phone number</label>
                        <input name="phone_number_store" type="text" class="form-control mb-2" placeholder="Enter your phone number" value="{{ old('phone_number_store', $order->phone_number ?? '') }}">

                        <label class="form-label">Email address</label>
                        <input name="email_address_store" type="email" class="form-control mb-2" placeholder="Enter your email address" value="{{ old('email_address_store', $order->email_address ?? '') }}">

                        <!-- Stores -->
                        <label for="address" class="form-label">Available Stores</label>
                        @foreach($stores as $store)
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="storePickup" value="{{ $store }}"
                                    {{ old('storePickup', $selectedStore ?? '') === $store ? 'checked' : '' }}>
                                <label class="form-check-label">{{ $store }}</label>
                            </div>
                        @endforeach

                    </div>

                </section>

            </div>

            <!-- Continue Button-->
            <div class="text-end mt-4">
                <button class="btn btn-primary px-4">Continue</button>
            </div>

        </form>

    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('js/delivery.js') }}"></script>
</body>

</html>