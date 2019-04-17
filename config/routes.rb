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
<<<<<<< HEAD
  # payment_method routes
  get 'payment_method/', to: "payment_method#index"
  get 'payment_method/new'
  
=======
  delete "/logout", to: "sessions#logout"
  # get "/profile", to: "users#show"  as:  "profile"
>>>>>>> branch_4
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
