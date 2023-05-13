class QuestionsController < ApplicationController

    def index
        @questions = Question.all
        # p @questions

    end

    def show
        # p params[:id]
        @question = Question.find(params[:id])
        # p @question

    end

    #1
    def new

        @question = Question.new

    end

    #3
    def create
        @question = Question.new(question_params)

        if @question.save
            redirect_to @question
        else
            render 'new',status: :unprocessable_entity
        end

    end

    def edit

        @question = Question.find(params[:id])


    end

    def update
        @question = Question.find(params[:id])

        if @question.update(question_params)
            redirect_to @question
        else
            render 'edit',status: :unprocessable_entity
        end
    end

    def destroy

        @question = Question.find(params[:id])
        @question.destroy

        redirect_to questions_path

    end

    #2
    private
        def question_params
            params.require(:question).permit(:title, :name, :content)
        end
end
