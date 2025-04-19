<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>Home</title>
    <link rel="icon" href="/images/icons/icon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/custom.css">
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Header -->
    @include('components.header')

    <!-- Spacer -->
    <div class="mt-5 mb-5"></div>

    <!-- Jumbotron -->
    <div class="bg-white shadow-sm align-items-center justify-content-center">
        <div class="container d-flex align-items-center justify-content-center">
            <h1 class="text-dark display-5 me-4">Welcome to BookByte!</h1>
            <img src="/images/banner.png" class="w-25" alt="Banner">
        </div>
    </div>

    <!-- Main -->
    <main class="container flex-fill pt-4 pb-5 mb-5">

        <!-- Bestsellers -->
        <div class="pt-1">
            <h2 class="display-6 text-center mb-2 mt-5">Bestsellers</h2>
            <hr>
            <div class="d-flex mb-5">
                <div style="overflow-x: auto; white-space: nowrap;">
                    <ul class="list-inline m-0 p-0">
                        @foreach ($bestsellers as $product)
                            @include('components.vertical_card', ['product' => $product])
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>

        <!-- Newcomers -->
        <div class="pt-1">
            <h2 class="display-6 text-center mb-2 mt-5">Newcomers</h2>
            <hr>
            <div class="d-flex mb-5">
                <div style="overflow-x: auto; white-space: nowrap;">
                    <ul class="list-inline m-0 p-0">
                        @foreach ($newcomers as $product)
                            @include('components.vertical_card', ['product' => $product])
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>

        <!-- Trending -->
        <div class="pt-1">
            <h2 class="display-6 text-center mb-2 mt-5">Trending</h2>
            <hr>
            <div class="d-flex mb-5">
                <div style="overflow-x: auto; white-space: nowrap;">
                    <ul class="list-inline m-0 p-0">
                        @foreach ($trending as $product)
                            @include('components.vertical_card', ['product' => $product])
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>

    </main>

    <!-- Footer -->
    @include('components.footer')

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
