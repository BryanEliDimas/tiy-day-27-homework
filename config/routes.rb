Rails.application.routes.draw do
  root 'posts#index'

  get 'tags/:tag' => 'tags#show', as: :tag

  get '/admin' => 'posts#new', as: :new_post
  post 'posts' => 'posts#create', as: :posts

  # Session controller
  get 'signup' => 'users#new', as: :sign_up
  post 'signup' => 'users#create', as: :users
  # ^ Named this way (as: :users) so Rails recognizes it and I can use it in the simple_form_for @user
  get 'signin' => 'session#new', as: :sign_in
  post 'signinsession' => 'session#create', as: :sign_in_session
  delete 'signout' => 'session#destroy', as: :sign_out

end
