Rails.application.routes.draw do

  resources :projects
  resources :dashboard, only: :index

  root to: 'pages#home'
end
