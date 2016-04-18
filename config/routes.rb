Rails.application.routes.draw do
  resources :posts
  resources :advertisements

  get 'about' => 'welcom#about'
  root 'welcome#index'
end
