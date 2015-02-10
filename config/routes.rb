Rails.application.routes.draw do

  resources :projects, only: [:index, :show]
  resources :dashboard, only: :index

  root to: 'pages#home'
end
