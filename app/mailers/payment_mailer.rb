# app/mailers/payment_mailer.rb
class PaymentMailer < ApplicationMailer
  default from: "from@clownschule-confetti.de"
  def success_email(email, name, product)
    @name = name
    @product = product

    mail(
      to: email,
      subject: "Vielen Dank für deinen Kauf!"
    )
  end

  def admin_notification(customer_email, customer_name, product, amount)
    @customer_email = customer_email
    @customer_name = customer_name
    @product = product
    @amount = amount

    mail(
      to: "sandracardamone@yahoo.de",  # Sandras Email hier
      subject: "Neuer Kauf: #{product}"
    )
  end
end
