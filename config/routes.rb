Rails.application.routes.draw do
  get 'home/index'
  resources :foods
  devise_for :users
  root to: 'home#index'
end
