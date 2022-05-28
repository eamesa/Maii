Rails.application.routes.draw do



  resources :favoritos
  resources :parts
  resources :fondos
  resources :admins
  devise_for :users
end
