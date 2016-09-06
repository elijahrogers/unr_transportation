Rails.application.routes.draw do
  root 'application#main'
  get 'application/update' => 'application#update'
  resources :users, only: [:new, :create, :edit, :delete] do
    resources :courses, only: [:index, :new, :create]
  end
  resources :courses, only: [:edit, :update, :destroy]
  get 'users/main'
  get 'users/login'
  post 'users/attempt_login'
  get 'users/logout'
end
