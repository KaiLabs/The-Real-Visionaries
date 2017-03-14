Rails.application.routes.draw do
  get 'home/index'

  get 'submissions/index'

  # get 'submissions/new'
  resource :submissions
  resource :home
  #root 'submissions#index'
  root 'home#index'

end
