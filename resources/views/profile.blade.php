{{-- components/profile.blade.php --}}

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Profile</title>
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/15.6.1/nouislider.min.js"></script>
    <link rel="stylesheet" href="/css/custom.css">
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    @include('components.header')

    <!-- Main -->
    <main class="container flex-fill mt-5 pt-4 pb-5 mb-5">
        
        <!-- Section -->
        <section class="container d-flex justify-content-center p-0">

            <!-- Profile Information -->
            <div class="w-100">

                <hr>

                <div class="d-flex flex-wrap justify-content-between align-items-center mb-0">

                    <h3 class="fw-bold col-12 col-md-auto">Profile</h3>

                    <!-- Log Out -->
                     <form action="{{ route('logout') }}" method="POST">
                        @csrf
                        <button class="border-0 bg-transparent text-primary fs-5 d-flex align-items-center col-12 col-md-auto mt-2 mt-md-0 justify-content-md-end">
                            Log Out
                            <i class="bi bi-box-arrow-in-right ms-2 fs-3"></i>
                        </button>
                    </form>

                </div>

                <!-- Fields -->
                <form action="{{ route('profile.update') }}" method="POST">

                    @csrf @method('PUT')
                    
                    <!-- Top Row -->
                    <div class="row mt-4">

                        <!-- First Name -->
                        <div class="col-md-4 position-relative ">
                            <label for="name" class="form-label">First Name</label>
                            <input
                                id="name"
                                name="name"
                                type="text"
                                class="form-control border border-2 border-dark @error('name') is-invalid @enderror"
                                value="{{ old('name', Auth::user()->name) }}"
                                placeholder="e.g., John"
                                required
                            >
                            @error('name') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                        </div>

                        <!-- Last Name -->
                        <div class="col-md-4 position-relative">
                            <label for="last_name" class="form-label">Last Name</label>
                            <input
                                id="last_name"
                                name="last_name"
                                type="text"
                                class="form-control border border-2 border-dark @error('last_name') is-invalid @enderror"
                                value="{{ old('last_name', Auth::user()->last_name) }}"
                                placeholder="e.g., Doe"
                            >
                            @error('last_name') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                        </div>

                        <!-- Date of Birth -->
                        <div class="col-md-4 position-relative">
                            <label for="birth_date" class="form-label">Date of Birth</label>
                            <input
                                id="birth_date"
                                name="birth_date"
                                type="date"
                                class="form-control border border-2 border-dark @error('birth_date') is-invalid @enderror"
                                value="{{ old('birth_date', Auth::user()->birth_date?->format('Y-m-d')) }}"
                            >
                            @error('birth_date') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                        </div>

                    </div>

                    <!-- Bottom Row -->
                    <div class="row mt-4">

                        <!-- Email -->
                        <div class="col-md-4 position-relative">
                            <label for="email" class="form-label">Email</label>
                            <input
                                id="email"
                                name="email"
                                type="email"
                                class="form-control border border-2 border-dark @error('email') is-invalid @enderror"
                                value="{{ old('email', Auth::user()->email) }}"
                                placeholder="e.g., john@example.com"
                                required
                            >
                            @error('email') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                        </div>

                        <!-- Phone Number -->
                        <div class="col-md-4 position-relative">
                            <label for="phone_number" class="form-label">Phone Number</label>
                            <input
                                id="phone_number"
                                name="phone_number"
                                type="tel"
                                class="form-control border border-2 border-dark @error('phone_number') is-invalid @enderror"
                                value="{{ old('phone_number', Auth::user()->phone_number) }}"
                                placeholder="e.g., +421 912 345 678"
                            >
                            @error('phone_number')
                                <div class="invalid-tooltip d-block">{{ $message }}</div>
                            @enderror
                        </div>


                        <!-- Save Button -->
                        <div class="col-md-4 col-12 d-flex align-items-end mt-3 mt-md-0">
                            <button type="submit" class="btn btn-primary w-100">
                                Save Changes
                            </button>
                        </div>

                    </div>

                </form>

            </div>

        </section>

        <!-- Section -->
        <section class=" container d-flex justify-content-center p-0 mt-5">

            <!-- Password Information -->
            <div class="w-100">

                <hr>

                <h3 class="fw-bold">Password</h3>

                <form action="{{ route('profile.password') }}" method="POST" class="mt-5">

                    @csrf @method('PUT')

                    <div class="row mt-4">

                        <!-- New Password -->
                        <div class="col-md-4 position-relative">
                            <label for="password" class="form-label">New Password</label>
                            <input
                                id="password"
                                name="password"
                                type="password"
                                class="form-control border border-2 border-dark @error('password') is-invalid @enderror"
                                placeholder="At least 6 characters"
                                required
                            >
                            @error('password') <div class="invalid-tooltip d-block">{{ $message }}</div> @enderror
                        </div>

                        <!-- Confirm Password -->
                        <div class="col-md-4 position-relative">
                            <label for="password_confirmation" class="form-label">Confirm Password</label>
                            <input
                                id="password_confirmation"
                                name="password_confirmation"
                                type="password"
                                class="form-control border border-2 border-dark"
                                placeholder="Repeat password"
                                required
                            >
                        </div>
                        
                        <!-- Update Button -->
                        <div class="col-md-4 col-12 d-flex align-items-end mt-3 mt-md-0">
                            <button type="submit" class="btn btn-primary w-100">
                                Update Password
                            </button>
                        </div>

                    </div>
                </form>

            </div>
            
        </section>

    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>