Rails.application.routes.draw do
  get 'home/index'

  get 'submissions/index'

  # get 'submissions/new'
  resource :home
  resources :submissions
  #root 'submissions#index'
  root 'home#index'

end
