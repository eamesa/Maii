Rails.application.routes.draw do



  resources :parts
  resources :fondos
  resources :admins
  devise_for :users
end
