Rails.application.routes.draw do
  get 'users/new'

  root 'posts#index'

  get '/admin' => 'posts#new', as: :new_post
  post 'posts' => 'posts#create', as: :posts

  # Session controller
  get 'sign_up' => 'users#new', as: :sign_up
  post 'sign_up' => 'users#create', as: :users
  # ^ Named this way (as: :users) so Rails recognizes it and I can use it in the simple_form_for @user
  get 'sign_in' => 'session#new', as: :sign_in
  post 'sign_in_session' => 'session#create', as: :sign_in_session
  delete 'sign_out' => 'session#destroy', as: :sign_out

end
