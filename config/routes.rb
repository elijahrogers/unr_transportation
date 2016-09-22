Rails.application.routes.draw do
  get 'application/update' => 'application#update'
  resources :users, only: [:new, :create, :edit, :destroy, :update] do
    resources :courses
  end
  get 'users/main'
  get 'users/login'
  post 'users/attempt_login'
  get 'users/logout'
  root 'application#main'
end
