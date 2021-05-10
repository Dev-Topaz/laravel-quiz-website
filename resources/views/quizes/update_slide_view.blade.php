<div class="row" style="height: 100%;margin: 0;">
    <div class="cell-8" style="background: #dcdcdc;display: flex;">
        <div style="margin: auto 10px;background: #f1f1f1;width: 100%;padding: 20px;min-height: 500px;">
            <div contenteditable="true" class="slide_view_textbox_editable slide_view_element" style="border: 1px solid black;width: 70%;">
                Select the correct answer option:
            </div>
        </div>
    </div>
    <div class="cell-4 slide_option" style="padding: 0 20px;">
        <h3 style="border-bottom: 1px dotted grey;padding: 15px 10px;">Slide Options</h3>
        <div>
            <div>
                <div class="row" style="padding: 0 10px;">
                    <div class="cell-5">
                        <label for="question_type" style="font-size: 16px;">Question type:</label>
                    </div>
                    <div class="cell-7">
                        <select data-role="select" data-filter="false" name="question_type">
                            <option value="dedicated_graded">Graded</option>
                            <option value="dedicated_survey">Survey</option>
                        </select>
                    </div>
                </div>
                <div id="slide_details" style="padding: 10px 10px 0 20px">
                    <div class="row">
                        <div class="cell-6">
                            <label for="feedback" name="feedback">Feedback:</label>
                        </div>
                        <div class="cell-6">
                            <select data-role="select" data-filter="false" name="feedback">
                                <option value="none">None</option>
                                <option value="by_result" selected>By Result</option>
                                <option value="by_choice">By Choice</option>
                            </select>
                        </div>
                        <div class="cell-6">
                            <label for="braching" name="braching">Branching:</label>
                        </div>
                        <div class="cell-6">
                            <select data-role="select" data-filter="false" name="braching">
                                <option value="by_result" selected>By Result</option>
                                <option value="by_choice">By Choice</option>
                            </select>
                        </div>
                        <div class="cell-6">
                            <label for="score" name="score">Score:</label>
                        </div>
                        <div class="cell-6">
                            <select data-role="select" data-filter="false" name="score">
                                <option value="by_result" selected>By Result</option>
                                <option value="by_choice">By Choice</option>
                            </select>
                        </div>
                        <div class="cell-6">
                            <label for="attempts" name="attempts">Attempts:</label>
                        </div>
                        <div class="cell-6">
                            <select data-role="select" data-filter="false" name="attempts">
                                <option value="1">1</option>
                                <option value="2" selected>2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="unlimited">Unlimited</option>
                            </select>
                        </div>
                        <div class="cell-7">
                            <input type="checkbox" data-role="checkbox"
                                   data-caption="Limit time to answer the question:">
                        </div>
                        <div class="cell-5">
                            <input class="mt-1" type="time" data-role="input" value="01:00" disabled
                                   data-clear-button="false">
                        </div>
                        <div class="cell-12">
                            <input type="checkbox" data-role="checkbox" data-caption="Shuffle answers">
                        </div>
                    </div>
                </div>
            </div>
            <div>Slide Layers</div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $(".slide_view_element").resizable();
        $(".slide_view_element").draggable();
    });
</script>

