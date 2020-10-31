class QuizzesController < ApplicationController

    def home
    end
    
    def new
        @quiz = Quiz.new
    end
    
    def show
        @quiz = Quiz.find(params[:id])
    end
    
    def create
        @quiz = Quiz.new(quiz_params)
        if @quiz.valid?
        @quiz.save
        redirect_to quiz_path(@quiz)
        else
        flash[:my_errors] = @quiz.errors.full_messages
        redirect_to new_quiz_path
        end
    end
    
    private
    
    def quiz_params
        params.require(:quiz).permit(:total_points, :accrued_points, :player_name)
    end
    
    
end
