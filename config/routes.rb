Rails.application.routes.draw do

  resources :projects
  resources :dashboard, only: :index
  resources :users, only: :create
  get 'users/sign_in', to: 'users#new'

  root to: 'pages#home'
end
