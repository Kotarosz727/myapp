Rails.application.routes.draw do
  
root "plays#index"
devise_for :users
  resources :users
  resources :plays
  
end
