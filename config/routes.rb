Rails.application.routes.draw do
  resources :users
  root to: 'sessions#login_form'
  resources :subscriptions
  resources :companies
  resources :card_details
  resources :paypal_details
  resources :bank_details
  get "/login_form", to: "sessions#login_form"
  post "/login", to: "sessions#login", as: "login"
  get "/profile", to: "users#profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
