Rails.application.routes.draw do
  devise_for :users
  
  get 'lectures/index'  => 'lectures#index'
  get 'lectures/new'  => 'lectures#new'
  post 'lectures/new'  => 'lectures#create'
  
  resources :yuchins do
    resources :tweets, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :perfumes

  root 'yuchins#index' 
end