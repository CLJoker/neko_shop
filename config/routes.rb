Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations'}

  root 'products#index'
  resource :cart, only: [:show]
  resources :products
  resources :order_items
  resources :accounts
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
