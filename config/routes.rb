# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'plays#index'
  devise_for :users
  resources :users
  resources :plays do
    resources :comments
    resources :favorites, only: %i[create destroy]
  end
end
