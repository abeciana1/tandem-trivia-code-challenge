class QuestionsController < ApplicationController
    
    def new
        @question = Question.new
    end
    
    def create
        @question = Question.new(question_params)
        if @question.valid?
        @question.save
        redirect_to question_path(@question)
        else
        flash[:my_errors] = @question.errors.full_messages
        redirect_to new_question_path
        end
    end
    
    private

    def question_params
        params.require(:question).permit(:question, :correct_choice_id, :quiz_id)
    end
    
    
end
