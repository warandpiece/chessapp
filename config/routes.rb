Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :games, :moves, :pieces
end
