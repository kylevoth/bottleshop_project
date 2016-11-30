Rails.application.routes.draw do
  get 'about' => 'about_controller#index', as: 'about'

  get 'products/by_cat/:type_id' => 'products#categorized', as:'categories'
  resources :products
  root to: 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
