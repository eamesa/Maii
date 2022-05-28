Rails.application.routes.draw do



  resources :portfolios
  resources :investments
  resources :values
  resources :favoritos
  resources :parts
  resources :fondos
  resources :admins
  devise_for :users
end
