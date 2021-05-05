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
    <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4.3.2/css/metro-all.min.css">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/navbar.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <link href="{{ asset('css/all.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/richtext.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

    <!-- Scripts -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  } );
  </script>
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
    <!--    modal library-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <script src="https://cdn.metroui.org.ua/v4.3.2/js/metro.min.js"></script>

    <script src="{{ asset('js/main.js') }}" defer></script>
    <script src="{{ asset('js/matching.js') }}" defer></script>
    <script src="{{ asset('js/text_dropdown.js') }}" defer></script>
{{--    <script src="{{ asset('js/jquery.richtext.min.js') }}" defer></script>--}}

    <script>
        function fetchsequencelist() {
            let list = '';
            let length = $('.ui-state-default label').length;

            for (let i = 0; i < length; i++) {
                list += $('.ui-state-default label').eq(i).html() + ';';
            }

            return list;
        }

        function fetchmatchinglist() {
            let list = '';
            let length = $('.ui-state-default').length;

            for (let i = 0; i <length; i++) {
                list += $('.ui-state-default:nth-child(' + (i + 1) + ') label').eq(0).html() + ';' + $('.ui-state-default:nth-child(' + (i + 1) + ') label').eq(1).html() + '@';
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
            $('.content').richText();
        });
    </script>
</body>
</html>
