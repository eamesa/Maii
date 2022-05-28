Rails.application.routes.draw do



  resources :fondos
  resources :admins
  devise_for :users
end
