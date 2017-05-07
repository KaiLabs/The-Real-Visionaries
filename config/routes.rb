Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'login/index'

  get 'home/index'

  get 'submissions/index'

  get 'submissions/thankyou'

  #reroute after searching
  get 'home/submissions' => 'submissions#index'

  resource :home
  resources :submissions



  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  root "login#index"
  # root "home#index"

  #required for country-state-select gem
  #mount CountryStateSelect::Rails::Engine, at: "/"


end
