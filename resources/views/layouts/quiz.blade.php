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
    <link href="{{ asset('css/metro-all.css') }}" rel="stylesheet">
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/navbar.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <link href="{{ asset('css/all.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/richtext.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/jquery.modal.min.css') }}" rel="stylesheet">

    <!-- Scripts -->
    <link href="{{ asset('css/jquery-ui.min.css') }}" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
{{--    <script src="{{ asset('js/jquery.min.js') }}" defer></script>--}}
    <script src="{{ asset('js/jquery-ui.min.js') }}" defer></script>

</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
<!--                    {{ config('app.name', 'Quiz Maker') }}-->
                    <img class="title" src="https://www.online-anytime.com.au/admin-logo1.png" style="margin-left: 8px;">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="navbar-collapse" id="navbarSupportedContent">
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

        <main class="py-4 quiz">
            @yield('content')
        </main>

    </div>
    <script src="{{ asset('js/jquery.modal.min.js') }}" defer></script>
    <script src="{{ asset('js/metro.js') }}" defer></script>
    <script src="{{ asset('js/main.js') }}" defer></script>
    <script src="{{ asset('js/matching.js') }}" defer></script>
    <script src="{{ asset('js/text_dropdown.js') }}" defer></script>
{{--    <script src="{{ asset('js/jquery.richtext.min.js') }}" defer></script>--}}

    <script>
        function fetchsequencelist() {
            let list = '';
            let length = $('.sequence_item label').length;

            for (let i = 0; i < length; i++) {
                list += $('.sequence_item label').eq(i).html() + ';';
            }

            return list;
        }

        function fetchmatchinglist() {
            let list = '';
            let length = $('.matching_item').length;

            for (let i = 0; i <length; i++) {
                list += $('.matching_item:nth-child(' + (i + 1) + ') label').eq(0).html() + ';' + $('.matching_item:nth-child(' + (i + 1) + ') label').eq(1).html() + '@';
            }
            return list;
        }

        function submitForm() {
            if ($('#sequence_array').length > 0) {
                 $('#sequence_array').val(fetchsequencelist());
            }

            if ($('#matching_array').length > 0) {
                 $('#matching_array').val(fetchmatchinglist());
            }
            const content = $("div.richText-editor").html();
            $("textarea#question").val(content);
            $("form#quiz_form").submit();
        }
        $(document).ready(function(){
            // $('.content').richText();
        });
    </script>
</body>
</html>
