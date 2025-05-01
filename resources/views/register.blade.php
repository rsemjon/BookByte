{{-- components/register.blade.php --}}

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>Registration</title>
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    @include('components.header')

    <!-- Main -->
    <main class="container flex-fill mt-5 pt-4 pb-5 mb-5">

        <hr>

        <h3 class="fw-bold text-center">Register</h3>

        <!-- Section -->
        <section class="container d-flex justify-content-center">
            <div class="w-50">
                <form action="{{ route ('register') }}" method="POST">

                    @csrf

                    <!-- First Name -->
                    <div class="mb-3">
                        <label for="name" class="form-label">First Name</label>
                        <input type="text" name="name" class="form-control border border-2 border-dark" id="firstName" placeholder="Enter your first name" required>
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" name="email" class="form-control border border-2 border-dark" id="email" placeholder="Enter your email" required>
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control border border-2 border-dark" id="password" placeholder="Enter your password" required>
                    </div>

                    <!-- Confirm Password -->
                    <div class="mb-3">
                        <label for="password_confirmation" class="form-label">Confirm Password</label>
                        <input type="password" name="password_confirmation" class="form-control border border-2 border-dark" id="confirmPassword" placeholder="Confirm your password" required>
                    </div>

                    <!-- Register Button -->
                    <button type="submit" class="btn btn-primary w-100 mb-3 mt-4">Register</button>

                    @if($errors->any())
                        <ul>
                            @foreach($errors->all() as $e)
                            <li>{{$e }}</li>
                            @endforeach
                        </ul>
                    @endif

                </form>
            </div>
        </section>

        <!-- Social Register -->
        <h5 class="text-center mt-3">Or continue with</h5>

        <div class="container d-flex flex-column flex-md-row align-items-center justify-content-center gap-3 pt-4">
            
            <!-- Google -->
            <a href="#" class="btn btn-dark w-auto d-flex align-items-center justify-content-center px-4 py-2">
                <span class="me-2">Google</span>
                <i class="bi bi-google"></i>
            </a>

            <!-- Apple -->
            <a href="#" class="btn btn-dark w-auto d-flex align-items-center justify-content-center px-4 py-2">
                <span class="me-2">Apple</span>
                <i class="bi bi-apple"></i>
            </a>

        </div>

        <!-- Login Redirection -->
        <p class="text-center mt-5">
            Already have an account?
            <a href="{{ route('display.login') }}" class="text-decoration-none text-primary"><strong>Log In here!</strong></a>
        </p>

    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>