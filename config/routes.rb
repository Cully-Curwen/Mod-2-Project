Rails.application.routes.draw do
  resources :users
  resources :companies
  resources :card_details, only: [:new, :create, :edit, :update]
  resources :paypal_details, only: [:new, :create, :edit, :update]
  resources :bank_details, only: [:new, :create, :edit, :update]
  # payment_method routes
  get "payment_method/", to: "payment_method#index"
  get 'payment_method/new'
  post 'payment_method/store', to: "payment_method#store"
  get 'payment_method/select', to: "payment_method#select"
  # subscriptions routes
  resources :subscriptions, only: [:index, :new, :create, :edit, :update]
  get "subscriptions/all", to: "subscriptions#all"
  post "subscriptions/store", to: "subscriptions#store"
  # sessions routes
  root to: 'sessions#splash'
  get "/register", to: "sessions#register"
  post "/create", to: "sessions#create"
  get "/login_form", to: "sessions#login_form"
  post "/login", to: "sessions#login", as: "login"
  delete "/logout", to: "sessions#logout"
  # get "/profile", to: "users#show"  as:  "profile"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end