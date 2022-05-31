Rails.application.routes.draw do



  resources :admins
  resources :favoritos
  devise_for :users
end
