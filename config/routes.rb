Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  # resource :dashboard, only: :show
  resources :games, only: [:index, :show, :new, :create, :update, :join]
  
  
  # post "games/:game_id/join" => "games#join"
  resources :games do
     post 'join'
   end
  resources :moves, :pieces

end