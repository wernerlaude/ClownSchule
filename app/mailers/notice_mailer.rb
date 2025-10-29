class NoticeMailer < ApplicationMailer
  default from: "from@clownschule-confetti.de"

  def notice_email
    @contact = params[:contact]
    mail(to: "sandracardamone@yahoo.de",     subject: "Neue Kontaktanfrage: #{@contact.betreff}",
         reply_to: @contact.email)
  end
end
