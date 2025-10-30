class PaymentsController < ApplicationController
  def create
    product = params[:product]

    products = {
      "clown-entdecken" => {
        name: "Entdecke den Clown in Dir",
        price: 5500 # 55,00 EUR in Cent
      },
      "klinikclown" => {
        name: "KlinikClown Ausbildung",
        price: 33300 # 333,00 EUR in Cent
      }
    }

    selected = products[product]

    # Fehlerbehandlung
    if selected.nil?
      redirect_to kontakt_zum_clown_path, alert: "Produkt nicht gefunden" and return
    end

    # Stripe Checkout Session erstellen
    session = Stripe::Checkout::Session.create({
                                                 payment_method_types: %w[card],
                                                 line_items: [ {
                                                                price_data: {
                                                                  currency: "eur",
                                                                  product_data: {
                                                                    name: selected[:name],
                                                                    description: "Online-Kurs Clownschule Confetti"
                                                                  },
                                                                  unit_amount: selected[:price]
                                                                },
                                                                quantity: 1
                                                              } ],
                                                 mode: "payment",

                                                 success_url: "#{kontakt_zum_clown_url(product: product, payment: 'success')}&session_id={CHECKOUT_SESSION_ID}",
                                                 cancel_url: kontakt_zum_clown_url(payment: "cancelled"),
                                                 locale: "de"
                                               })

    redirect_to session.url, allow_other_host: true
  end
end
