Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'login/index'

  get 'home/index'

  get 'submissions/index'

  # get 'submissions/new'
  resource :home
  resources :submissions

  #root 'submissions#index'
  # root 'home#index'


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  # root "login#index"
  root "home#index"


end
