Rails.application.routes.draw do

  root "portfolios#index"

  resources :values
  resources :investmentsparts
  resources :portfolios
  resources :investments
  resources :parts
  resources :fondos
  resources :admins
  resources :favoritos
  devise_for :users
end
