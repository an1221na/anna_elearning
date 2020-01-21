Rails.application.routes.draw do
  namespace :admin do
    get 'home', to: 'static_pages#home'
    get 'users', to: 'users#index'
    resources :users, only: [:update, :destroy]
    resources :categories do
      resources :words
    end
  end

  

  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/categories', to: 'categories#index'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :words, only: [:index]

  resources :lessons do
    resources :answers
  end

end