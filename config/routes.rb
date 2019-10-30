Rails.application.routes.draw do
  root to: 'pages#home'
  get 'features', to: 'pages#features'
  get 'contact', to: 'pages#contact'

  get 'portfolio', to: 'pages#portfolio'
  get 'pricing', to: 'pages#pricing'
  get 'team', to: 'pages#team'
  get 'skills', to: 'pages#skills'
  get 'clients', to: 'pages#clients'
end
