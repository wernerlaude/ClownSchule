# config/initializers/stripe.rb
Stripe.api_key = if Rails.env.production?
                   Rails.application.credentials.dig(:stripe, :secret_key)
else
                   "sk_test_51SKcS8RscjamN1rxJV2l3gdiypBGNcvbKCgvVJy30bLSqS4nxqJEdyIaDTBgkC0U4Nqxn51zUejSP8jUlHx9kncx00FLNOrL6r"
end
