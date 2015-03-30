Rails.application.routes.draw do
  resources :players
  root 'players#index'

  get 'matches/new' => 'matches#new'
  get 'matches/new'
  get 'matches/create'
  get 'matches/:id' => 'matches#show', as: :show_match

  post 'matches' => 'matches#create'

end
