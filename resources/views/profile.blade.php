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
                <form>
                    
                    <!-- Top Row -->
                    <div class="row mt-4">

                        <!-- First Name -->
                        <div class="col-md-4">
                            <label for="name" class="form-label">First Name</label>
                            <input type="text" class="form-control border border-2 border-dark" id="name" placeholder="{{ Auth::user()->name }}" required>
                        </div>

                        <!-- Second Name -->
                        <div class="col-md-4">
                            <label for="second_name" class="form-label">Second Name</label>
                            <input type="text" class="form-control border border-2 border-dark" id="second_name" placeholder="{{ Auth::user()->last_name }}" required>
                        </div>

                        <!-- Date of Birth -->
                        <div class="col-md-4">
                            <label for="birth_date" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control border border-2 border-dark" id="birth_date" placeholder="{{ Auth::user()->birth_date }}" required>
                        </div>

                    </div>

                    <!-- Bottom Row -->
                    <div class="row mt-4">

                        <!-- Email -->
                        <div class="col-md-4">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control border border-2 border-dark" id="email" placeholder="{{ Auth::user()->email }}" required>
                        </div>

                        <!-- Phone Number -->
                        <div class="col-md-4">
                            <label for="phone_number" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control border border-2 border-dark" id="phone_number" placeholder="{{ Auth::user()->phone_number }}" required>
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

                <form>
                    <div class="row mt-4">

                        <!-- New Password -->
                        <div class="col-md-4">
                            <label for="password" class="form-label">New Password</label>
                            <input type="password" class="form-control border border-2 border-dark" id="password" placeholder="Enter your new password" required>
                        </div>

                        <!-- Confirm Password -->
                        <div class="col-md-4">
                            <label for="confirm_password" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control border border-2 border-dark" id="confirm_password" placeholder="Confirm your password" required>
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