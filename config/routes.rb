Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'application/update' => 'application#update'
  resources :users, only: [:new, :create, :edit, :update] do
    resources :courses
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  get 'users/main'
  get 'users/login'
  post 'users/attempt_login'
  get 'users/logout'
  root 'application#main'
end
