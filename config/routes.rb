Rails.application.routes.draw do
 resources :plays
 root "play#index"
end
