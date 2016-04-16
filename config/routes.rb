Rails.application.routes.draw do
  resources :posts

  get 'about' => 'welcom#about'
  root 'welcome#index'
end
