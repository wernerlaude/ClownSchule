Rails.application.routes.draw do
  root "pages#index"

  get "clownschule-online", to: "pages#workshops", as: :clownschule_online

  get "kontakt-zum-clown" => "pages#fragen"
  get "ausbildung-zum-klinikclown" => "pages#klinik"
  get "sandra-cardamone" => "pages#about"

  resources :contacts, only: %i[new create]
  get "contacts/success" => "contacts#success", as: :contact_success
  resources :movies, only: %i[index show], path: "videos-mit-dem-clown"

  # Stripe Payments
  post "payments/create", to: "payments#create", as: :create_payment
  get "payments/success", to: "payments#success", as: :payment_success
  get "payments/cancel", to: "payments#cancel", as: :payment_cancel


  get "impressum" => "pages#impressum"
  get "datenschutz" => "pages#datenschutz"

  get "klinikclown_kurs" => redirect("ausbildung-zum-klinikclown", status: 301)
  get "achtsame_kunst_der_klinik_clowns" => redirect("achtsame-kunst-der-klinik-clowns", status: 301)
  get "ausbildung_klinikclown" => redirect("ausbildung-zum-klinikclown", status: 301)
  get "clown_coaching_lebenskunst" => redirect("clown-coaching-lebenskunst", status: 301)
  get "frage_den_clown" => redirect("frage-den-clown", status: 301)
  get "regie_text" => redirect("regie-text", status: 301)
  get "ueber_sandra" => redirect("sandra-cardamone", status: 301)
  get "sandra_cardamone" => redirect("sandra-cardamone", status: 301)
  get "videos_mit_dem_clown/:id" => redirect("videos-mit-dem-clown/%{id}", status: 301)
  get "videos_mit_dem_clown" => redirect("videos-mit-dem-clown", status: 301)

  get "up" => "rails/health#show", as: :rails_health_check

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
