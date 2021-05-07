@switch($quiz->type_id)
    @case(1)
        @include('updatequiz.multiple_choice', array('quiz' => $quiz))
        @break

    @case(2)
        @include('updatequiz.multiple_response', array('quiz' => $quiz))
        @break

    @case(3)
        @include('updatequiz.true_false', array('quiz' => $quiz))
        @break

    @case(4)
        @include('updatequiz.short_answer', array('quiz' => $quiz))
        @break

    @case(5)
        @include('updatequiz.numeric', array('quiz' => $quiz))
        @break

    @case(6)
        @include('updatequiz.sequence', array('quiz' => $quiz))
        @break

    @case(7)
        @include('updatequiz.matching', array('quiz' => $quiz))
        @break

    @default
        @include('updatequiz.multiple_choice', array('quiz' => $quiz))

@endswitch
