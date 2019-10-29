Rails.application.routes.draw do
  root to: 'pages#home'
  get 'features', to: 'pages#features'
  get 'contact', to: 'pages#contact'
end
