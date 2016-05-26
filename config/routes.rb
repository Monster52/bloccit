Rails.application.routes.draw do
  root 'welcome#index'

  get 'about', to: 'welcome#about'
  
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end


  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :labels, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :topics, except: [:edit, :new]
      resources :posts, only: [:update, :create, :destroy]
    end
  end
end
