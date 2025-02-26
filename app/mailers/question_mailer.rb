class QuestionMailer < ApplicationMailer

  default from: 'norepy@clownschule-confetti.de'

  def question_email
    @question = params[:question]
    mail(to: 'cardamonesandra@googlemail.com', subject: 'Frage Clownschule Confetti!!')
    #mail(to: 'mail@laude.dev', subject: 'Frage Clownschule Confetti!!')
  end
end
