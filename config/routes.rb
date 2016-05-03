Rails.application.routes.draw do
  root 'welcome#index'
  
  get 'about', to: 'welcome#about'
  
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

end
