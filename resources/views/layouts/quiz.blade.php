<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="url" content="{{ url('/') }}">

    <title>{{ config('app.name', 'Quiz Maker') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
    <link href="{{ asset('css/metro-all.css') }}" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/navbar.css') }}" rel="stylesheet">
    <link href="{{ asset('css/main.css') }}" rel="stylesheet">
    <link href="{{ asset('css/all.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/richtext.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/jquery.modal.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/evol-colorpicker.min.css') }}" rel="stylesheet">

    <!-- Scripts -->
    <link href="{{ asset('css/jquery-ui.min.css') }}" rel="stylesheet">
    <script src="{{ asset('js/jquery3.2.1.min.js') }}"></script>
    <script src="{{ asset('js/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('js/evol-colorpicker.min.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.7.22/fabric.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.lazyload/1.9.1/jquery.lazyload.js"></script>
</head>
<body id="quiz_layout">
<div class="se-pre-con"></div>
<div id="question_save_alert" class="quiz_dialog">
    <div id="alert_content" class="quiz_dialog_content">Some changes will be lost. Are you sure you want to continue?
    </div>
    <div id="alert_btn" class="quiz_dialog_btn">
        <button id="alert_save" class="button success">Save and Continue</button>
        <button id="alert_not_save" class="button alert" style="margin-bottom: 0">Continue without Saving</button>
        <button id="alert_cancel" class="button light">Cancel</button>
    </div>
</div>
<div id="delete_confirm_dialog" class="quiz_dialog">
    <input id="delete_dialog_id" type="text" hidden>
    <div id="delete_dialog_content" class="quiz_dialog_content">Are you sure you want to delete?</div>
    <div id="delete_dialog_btn" class="quiz_dialog_btn">
        <button id="delete_yes" class="button success">OK</button>
        <button id="delete_no" class="button light">Cancel</button>
    </div>
</div>
<div id="preview_toast" style="display: none;">
    <div id="preview_toast_title">Incorrect</div>
    <div id="preview_toast_body">You didn't choose the correct answer.</div>
</div>
<div id="app">
    <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm" style="margin: 0">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}">
            <!--                    {{ config('app.name', 'Quiz Maker') }}-->
                <img class="title" src="https://www.online-anytime.com.au/admin-logo1.png" style="margin-left: 8px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="{{ __('Toggle navigation') }}">
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

    <main class="quiz">
        @yield('content')
    </main>

</div>
<script src="{{ asset('js/jquery.modal.min.js') }}" defer></script>
<script src="{{ asset('js/metro.js') }}" defer></script>
<script src="{{ asset('js/main.js') }}" defer></script>
{{--<script src="{{ asset('js/matching.js') }}" defer></script>--}}
{{--<script src="{{ asset('js/text_dropdown.js') }}" defer></script>--}}
{{--    <script src="{{ asset('js/jquery.richtext.min.js') }}" defer></script>--}}

<script>
    $("img").lazyload({
	    effect : "fadeIn"
	});
    function show_modal(type, title, content) {
        switch (type) {
            case 'error':
                $('#preview_toast_title').css('background', '#D55F51');
                break;

            case 'success':
                $('#preview_toast_title').css('background', '#6BBA4A');
                break;
        }

        $('#preview_toast_title').html(title);
        $('#preview_toast_body').html(content);
        $('#preview_toast').fadeIn(500);
        setTimeout(function () {
            $('#preview_toast').fadeOut(500);
        }, 3000);

        return type + ': ' + title + ': ' + content;
    }

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

        for (let i = 0; i < length; i++) {
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

    $(document).ready(function () {
        // $('.content').richText();
    });
</script>
</body>
</html>
