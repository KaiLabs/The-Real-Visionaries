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
  resources :submissions do
    member { get :approvereview }
  end

  #flag boolean as true
<<<<<<< HEAD
  get 'submissions/approvereview'
  put 'submissions/approvereview'
=======
>>>>>>> 165cfb6d140ad8b694fa1c5774488afc8f4dd1ed


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  root "login#index"


end
