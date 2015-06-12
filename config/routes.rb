Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  root 'posts#index'

  get '/admin' => 'posts#new', as: :new_post
  post 'posts' => 'posts#create', as: :posts

  # Session controller
  get 'sign_up' => 'session#new', as: :sign_up
  post 'sign_up' => 'session#create', as: :create_user
  get 'sign_in' => 'session#new', as: :sign_in
  post 'sign_in_session' => 'session#create', as: :sign_in_session
  delete 'sign_out' => 'session#destroy', as: :sign_out

end
