Rails.application.routes.draw do
<<<<<<< HEAD
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
=======
>>>>>>> xm_25_checkpoint
  root 'welcome#index'
  get 'about', to: 'welcome#about'
end
