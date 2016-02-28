Rails.application.routes.draw do
  root to: 'home#index'
  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: [:create]
  end

  resources :categories, only: [:show, :new, :create] do
    resources :jifs, only: [:show]
  end

  namespace :admin do
    resources :users, only: [:show, :index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
