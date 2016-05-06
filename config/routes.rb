Rails.application.routes.draw do
  root 'welcome#index'

  get 'about', to: 'welcome#about'

  resources :topics do
    resources :posts, except: [:index]
    resources :comments, module: :topics
  end

  resources :posts, except: [] do
    resources :comments, module: :posts
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :labels, only: [:show]

end
