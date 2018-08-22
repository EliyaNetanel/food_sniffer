Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :diets, only: [:show, :new, :create, :edit, :update]
  resources :scans, only: [:new, :create, :show, :get_barcode]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
