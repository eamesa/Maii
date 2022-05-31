Rails.application.routes.draw do

  resources :investmentsparts
  resources :portfolios
  resources :investments
  resources :parts
  resources :fondos
  resources :admins
  resources :favoritos
  devise_for :users
end
