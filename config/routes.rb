Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  resources :wikis
  resources :users
  resources :charges, only: [:new, :create]
  resources :collaborators
  put  'downgrade' , to: 'users#downgrade'


  get 'about' => 'welcome#about'

  root 'welcome#index'
end
