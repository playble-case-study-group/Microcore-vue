<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

<<<<<<< HEAD
    <title>{{ config('app.name', 'Microcore') }}</title>
=======
    <title>{{ config('app.name', 'Museum of Spain') }}</title>
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        @include ('partials.nav')
        <div class="wrapper">
            {{--@auth--}}
            <left-menu></left-menu>
            {{--<!-- <right-menu></right-menu> -->--}}
            {{--@endauth--}}
            @yield('content')
        </div>

    </div>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}"></script>

    @yield('page-script')
</body>
</html>
