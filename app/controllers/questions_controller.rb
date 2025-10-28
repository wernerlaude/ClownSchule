class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @question.textcaptcha
  end

  # POST /members or /members.json
  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.valid?
        QuestionMailer.with(question: @question).question_email.deliver_now
        format.html { redirect_to success_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def success; end

  private

  def question_params
    params.require(:question).permit(:textcaptcha_answer, :textcaptcha_key, :name, :email, :frage)
  end
end
