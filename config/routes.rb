Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: [:new, :create, :show, :index, :destroy]
  resources :users
  root to: 'pages#home'

  get "/login" => 'sessions#new', :as => 'login'
  post "/login" => 'sessions#create'
  delete "/login" => 'sessions#destroy'

  get '/teams' => 'teams#index'
  get '/teams/:id' => 'teams#show'

end
