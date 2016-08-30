Rails.application.routes.draw do
  root 'application#main'
  get 'application/update' => 'application#update'
  resources :users, only: [:new, :create, :edit, :delete]
  get 'users/main'
  get 'users/login'
  post 'users/attempt_login'
  get 'users/logout'
end
