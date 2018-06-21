
<<<<<<< HEAD
<nav class="navbar navbar-expand-lg navbar-dark bg-blue navbar-default navbar-static-top">
    <!-- Branding Image -->
    <a class="navbar-brand" href="{{ url('/home') }}">
        <img id="logo" src="img/logo/Microcore_Logo-White.svg" alt="logo">
=======
<nav class="navbar navbar-expand-lg navbar-light bg-white navbar-default navbar-static-top">
    <!-- Branding Image -->
    <a class="navbar-brand" href="{{ url('/home') }}">
        <img src="img/logo/red.png" alt="logo">
        <span>{{ config('app.name', 'Museum of Spain') }}</span>
        <small>With a sub title</small>
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6

    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#app-navbar-collapse" aria-controls="app-navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>


    <div class="collapse navbar-collapse" id="app-navbar-collapse">
        <!-- Left Side Of Navbar -->
        <ul class="nav navbar-nav">
            &nbsp;
        </ul>

        <!-- Right Side Of Navbar -->
        <ul class="navbar-nav ml-auto">
            <!-- Authentication Links -->
            @guest
                <li class="nav-item"><a class="nav-link" href="{{ route('login') }}">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="{{ route('register') }}">Register</a></li>
            @else

                <navigation
                        :title="'Library'"
                        :link="'/library'">
                </navigation>
                <navigation
<<<<<<< HEAD
                        :title="'Video Call'"
                        :link="'/videocall'"
                        :notifications="$store.state.notifications.newVideoMessages">
=======
                        :title="'Gallery'"
                        :link="'/gallery'"
                        :notifications="$store.state.notifications.newArtifacts">
                </navigation>
                <navigation
                        :title="'Video Call'"
                        :link="'/videocall'">
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
                </navigation>
                <navigation
                        :title="'Email'"
                        :link="'/email'"
                        :notifications="$store.state.notifications.newEmails">
                </navigation>
<<<<<<< HEAD
                @if(Auth::user()->current_day > 1)
                <navigation
                        :title="'Scene'"
                        :link="'/scene'">
                </navigation>
                @endif
=======
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
                <li class="nav-item dropdown" style="text-transform: uppercase !important; font-family: 'Raleway', sans-serif;">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">
                        {{ Auth::user()->name }} <span class="caret"></span>
                    </a>

                    <div class="dropdown-menu">
<<<<<<< HEAD
                        <a class="dropdown-item" href="/about">About</a>
                        <a class="dropdown-item" href="/team">The Team</a>
=======
>>>>>>> 23ae1613c2682474ae9099201263f564a66a50e6
                        @if(Auth::user()->role == 2)
                            <a class="dropdown-item" href="/classes">Classes</a>
                        @endif
                        <a class="dropdown-item" href="{{ route('logout') }}"
                            onclick="event.preventDefault();
                                     document.getElementById('logout-form').submit();">
                            Logout
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>
                    </div>
                </li>
            @endguest
        </ul>
    </div>
</nav>