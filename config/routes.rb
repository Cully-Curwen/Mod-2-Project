Rails.application.routes.draw do
  resources :users
  root to: 'sessions#login_form'
  resources :subscriptions
  resources :companies
  resources :card_details, only: [:new, :create, :edit, :update]
  resources :paypal_details, only: [:new, :create, :edit, :update]
  resources :bank_details, only: [:new, :create, :edit, :update]
  get "/login_form", to: "sessions#login_form"
  post "/login", to: "sessions#login", as: "login"
  get "/profile", to: "users#profile"
  # payment_method routes
  get 'payment_method/', to: "payment_method#index"
  get 'payment_method/new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
