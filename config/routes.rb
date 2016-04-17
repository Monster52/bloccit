Rails.application.routes.draw do
  root 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'contact', to: 'welcome#contact'
end
