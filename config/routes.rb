Rails.application.routes.draw do
  devise_for :users
  root 'contents#index'
  get   'users/:id'   =>  'users#show'
  resources :contents, only: [:index, :new, :create, :destroy, :edit, :update]
end
