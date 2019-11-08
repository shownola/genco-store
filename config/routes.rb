Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  devise_for :users
  root to: 'pages#home'
  get 'contact', to: 'pages#contact'




  
end
