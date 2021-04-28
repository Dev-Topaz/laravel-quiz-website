<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Quiz Maker') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/navbar.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <link href="{{ asset('css/all.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/richtext.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <!-- Scripts -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
<!--                    {{ config('app.name', 'Laravel') }}-->
                    <img class="title" src="https://www.online-anytime.com.au/admin-logo1.png" style="margin-left: 8px;">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <li class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="{{ url('/exams') }}">
                                <i class="fas fa-award"></i>
                                <h6>{{ __('Exams') }}</h6>
                            </a>
                        </li>
                        @hasrole('manager')
                        <li class="nav-item">
                            <a class="nav-link" href="{{ url('/users') }}">
                                <i class="far fa-user"></i>
                                <h6>{{ __('Users') }}</h6>
                            </a>
                        </li>
                        @endhasrole
                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('logout') }}"
                                onclick="event.preventDefault();
                                    document.getElementById('logout-form').submit();">
                                <i class="fas fa-sign-out-alt"></i>
                                <h6>{{ __('Logout') }}</h6>
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                @csrf
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4">
            @yield('content')
        </main>
    </div>
    <!--    modal library-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

    <script src="{{ asset('js/app.js') }}" defer></script>
    <script src="{{ asset('js/main.js') }}" defer></script>
    <script src="{{ asset('js/jquery.richtext.min.js') }}" defer></script>
    <script>
        function submitForm() {
            const content = $("div.richText-editor").html();
            $("textarea#question").val(content);
            $("form#quiz_creat_form").submit();
        }
        $(document).ready(function(){
            $('.content').richText();
            // // select the target node
            // var target = document.querySelector('.richText-editor');
            //
            // // create an observer instance
            // var observer = new MutationObserver(function(mutations) {
            //     mutations.forEach(function(mutation) {
            //         console.log(mutation.target.innerHTML);
            //     });
            // });
            //
            // // configuration of the observer:
            // var config = { attributes: true, childList: true, characterData: true }
            //
            // // pass in the target node, as well as the observer options
            // observer.observe(target, config);
            //
            // // later, you can stop observing
            // // observer.disconnect();
        });

    </script>
</body>
</html>
