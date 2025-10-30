class PagesController < ApplicationController
  def index
  end
  def workshops
  end

  def fragen
    @contact = Contact.new
    @contact.textcaptcha

    if params[:payment] == "success" && params[:session_id].present?
      session_id = params[:session_id]

      begin
        # Session von Stripe holen
        checkout_session = Stripe::Checkout::Session.retrieve(session_id)

        # Kundendaten extrahieren
        customer_email = checkout_session.customer_details.email
        customer_name = checkout_session.customer_details.name
        amount = checkout_session.amount_total / 100.0
        product = params[:product]

        # Emails senden
        PaymentMailer.success_email(customer_email, customer_name, product).deliver_now
        PaymentMailer.admin_notification(customer_email, customer_name, product, amount).deliver_now
      rescue Stripe::StripeError => e
        Rails.logger.error "Stripe Error: #{e.message}"
      end
    end
  end

  def about
  end

  def impressum
  end

  def datenschutz
  end
end
