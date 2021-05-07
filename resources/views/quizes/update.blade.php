@switch($quiz->type_id)
    @case(1)
        @include('updatequiz.multiple_choice', array('quiz' => $quiz))
        @break

    @case(2)
        @include('updatequiz.multiple_response', array('quiz' => $quiz))
        @break

    @default
        @include('updatequiz.multiple_choice', array('quiz' => $quiz))

@endswitch
