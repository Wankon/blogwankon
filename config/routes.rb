Rails.application.routes.draw do

  resources :users
  root 'blogs#index'

  resources :blogs

end
