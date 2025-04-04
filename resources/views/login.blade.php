<!-- login.html -->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>Login</title>
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    @include('header')

    <!-- Main Content -->
    <main class="container flex-fill mt-5 pt-4 pb-5 mb-5">
        <hr>
        <ul class="list-inline d-flex align-items-center justify-content-center">
            <li class="list-inline-item me-3">
                <h3 class="fw-bold">Login</h3>
            </li>
        </ul>

        <div class="container d-flex justify-content-center">
            <div class="w-50">
                <form action="{{ route ('login') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" name="email" class="form-control border border-2 border-dark" id="email"
                            placeholder="Enter your email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control border border-2 border-dark" id="password"
                            placeholder="Enter your password" required>
                    </div>
                    <button type="button" class="btn btn-primary w-100 mb-3 mt-4"
                        onclick="window.location.href='index.html'">
                        Login
                    </button>
                </form>
            </div>
        </div>
        <h5 class="text-center mt-3">Or continue with</h5>

        <div class="container d-flex flex-column flex-md-row align-items-center justify-content-center gap-3 pt-4">
            <a href="#" class="btn btn-dark w-auto d-flex align-items-center justify-content-center px-4 py-2">
                <span class="me-2">Google</span>
                <i class="bi bi-google"></i>
            </a>
            <a href="#" class="btn btn-dark w-auto d-flex align-items-center justify-content-center px-4 py-2">
                <span class="me-2">Apple</span>
                <i class="bi bi-apple"></i>
            </a>
        </div>

        <p class="text-center mt-5">
            Don't have an account?
            <a href="{{ route('display.register') }}" class="text-decoration-none text-primary"><strong>Register here!</strong></a>
        </p>



    </main>

    <!-- Footer -->
    @include('footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>