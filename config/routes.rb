Rails.application.routes.draw do

  resources :projects, only: [:index, :show]

  root to: 'pages#home'
end
