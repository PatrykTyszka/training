Rails.application.routes.draw do

  resources :projects
  resources :dashboard, only: :index
  resources :users

  root to: 'pages#home'
end
