Rails.application.routes.draw do
  #get 'order_items/create'

  #get 'order_items/update'

  #get 'order_items/destroy'

  #get 'carts/show'
  get 'products/srch' => 'products#search'
  get 'products/:id' => 'products#show', as: 'showproduct'

  get 'products/by_cat/:type_id' => 'products#categorized', as:'categories'
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :charges, only: [:new, :create]
  root to: 'products#index'

  resources :contacts
  get 'about' => 'about_controller#index', as: 'about'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
