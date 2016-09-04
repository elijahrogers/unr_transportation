Rails.application.routes.draw do
  root 'application#main'
  get 'application/update' => 'application#update'
  resources :users, only: [:new, :create, :edit, :delete]
  resources :courses, only: [:new, :create, :show, :update, :delete]
  get 'users/main'
  get 'users/login'
  post 'users/attempt_login'
  get 'users/logout'
end
