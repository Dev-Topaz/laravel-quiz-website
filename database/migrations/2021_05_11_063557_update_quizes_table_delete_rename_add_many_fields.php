<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateQuizesTableDeleteRenameAddManyFields extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('quizes', function (Blueprint $table) {
             $table->renameColumn('exam_id', 'exam_group_id');
             $table->renameColumn('question', 'question_element');
             $table->dropColumn(['layout', 'is_feedback', 'is_draft', 'answer_content_id', 'answer_id']);
             $table->string('answer_element');
             $table->string('question_type')->nullable();
             $table->string('feedback_type')->nullable();
             $table->string('branching')->nullable();
             $table->string('score')->nullable();
             $table->string('attempts')->nullable();
             $table->boolean('is_limit_time')->nullable();
             $table->string('limit_time')->nullable();
             $table->boolean('shuffle_answers')->nullable();
             $table->boolean('partially_correct')->nullable();
             $table->boolean('limit_number_response')->nullable();
             $table->boolean('case_sensitive')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
