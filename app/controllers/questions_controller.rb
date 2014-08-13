class QuestionsController < ApplicationController


  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to questions_path, notice: "Question created successfully"
    else
      render :new
    end
  end

  private

  def question_params
    # {title: "title entered by user", description: "description entered by user"}
    params.require(:question).permit(:title, :description)
  end
  
end
