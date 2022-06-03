Rails.application.routes.draw do

  root "portfolios#index"

  devise_for :users
  
  resources :values
  resources :investmentsparts
  resources :portfolios
  resources :investments
  resources :parts
  resources :fondos
  resources :admins
  resources :favoritos
end
