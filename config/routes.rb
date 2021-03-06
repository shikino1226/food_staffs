Rails.application.routes.draw do
  resources :recipe_processes
  resources :recipe_foods
  resources :recipes do
    collection do
      get 'search'
    end
  end
  get 'home/index'
  resources :foods
  devise_for :users
  root to: 'home#index'
end
