Rails.application.routes.draw do
  resources :subscriptions
  resources :companies
  resources :card_details
  resources :paypal_details
  resources :bank_details
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
