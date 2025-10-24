Rails.application.routes.draw do
  root "pages#index"

  get "frage-den-clown" => "pages#fragen"
  get "ausbildung-zum-klinikclown" => "pages#klinik"
  get "sandra-cardamone" => "pages#about"

  get "achtsame-kunst-der-klinik-clowns", to: "pages#show_klinik_text"
  get "clown-coaching-lebenskunst", to: "pages#show_lebenskunst_text"
  get "regie-text", to: "pages#show_regie_text"

  resources :questions, only: %i[new create]
  get "questions/success" => "questions#success", as: :success

  resources :movies, only: %i[index show], path: "videos-mit-dem-clown"

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
end
