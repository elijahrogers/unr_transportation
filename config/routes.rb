Rails.application.routes.draw do
  root 'application#main'
  get 'application/update' => 'application#update'
end
