Rails.application.routes.draw do
  resources :users
  root to: 'users#index'
  resources :subscriptions
  resources :companies
  resources :card_details
  resources :paypal_details
  resources :bank_details
  get "/login_form", to: "sessions#login_form"
  post "/login", to: "sessions#login", as: "login"
  # payment_method routes
  get 'payment_method/', to: "payment_method#index"
  get 'payment_method/new'
  delete "/logout", to: "sessions#logout"
  # get "/profile", to: "users#show"  as:  "profile"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
# Prefix Verb   URI Pattern                                                                              Controller#Action
# posts POST   /posts(.:format)                                                                         posts#create
# new_post GET    /posts/new(.:format)                                                                     posts#new
#  post GET    /posts/:id(.:format)                                                                     posts#show
# users POST   /users(.:format)                                                                         users#create
# new_user GET    /users/new(.:format)                                                                     users#new
#  user GET    /users/:id(.:format)                                                                     users#show
# add_comment POST   /posts/:id/add_comment(.:format)                                                         posts#add_comment
# login_form GET    /login_form(.:format)                                                                    sessions#login_form
# login POST   /login(.:format)                                                                         sessions#login
# logout DELETE /logout(.:format)                                                                        sessions#logout
# profile GET    /profile(.:format)                                                                       users#profile
#       DELETE /comments/:id(.:format)