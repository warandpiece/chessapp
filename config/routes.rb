Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  # resource :dashboard, only: :show
  resources :games, only: [:index, :show, :new, :create, :update]
  
  
  post "games/:game_id/join" => "games#update"
  # resources :games do
  #   put 'join'
  # end
  resources :moves, :pieces

end