Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://www.clownschule-confetti.de/:80'
    resource '/videos',
             headers: :any,
             methods: [:get]
    origins 'http://0.0.0.0:3000'
    resource '/videos',
             headers: :any,
             methods: [:get]
  end
end