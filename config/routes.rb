Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  # resource :dashboard, only: :show
  resources :games, only: [:index, :show, :new, :create, :update, :join]
  
  resources :games do
     post 'join'
   end
  resources :moves, :pieces

end