Rails.application.routes.draw do
  resources :processes
  resources :recipe_foods
  resources :recipes
  get 'home/index'
  resources :foods
  devise_for :users
  root to: 'home#index'
end
