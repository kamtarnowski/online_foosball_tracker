Rails.application.routes.draw do

  resources :players
  root 'players#index'

  get 'matches/new' => 'matches#new'

  get 'matches/new'

  get 'matches/create'

  post 'matches' => 'matches#new'

end
