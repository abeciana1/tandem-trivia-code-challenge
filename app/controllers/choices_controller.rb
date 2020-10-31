class ChoicesController < ApplicationController
    
    def new
        @choice = Choice.new
    end
    
    def create
        @choice = Choice.new(choice_params)
        if @choice.valid?
        @choice.save
        redirect_to choice_path(@choice)
        else
        flash[:my_errors] = @choice.errors.full_messages
        redirect_to new_choice_path
        end
    end
    
    private
    
    def choice_params
        params.require(:choice).permit(:choice, :correct, :point_value, :question_id)
    end
    
    
end
