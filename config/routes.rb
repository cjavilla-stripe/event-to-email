Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }
  get '/connect/callback', to: 'omniauth_callbacks#stripe_connect'
  resources :event_configs
  resources :webhooks, only: [:create]
end
