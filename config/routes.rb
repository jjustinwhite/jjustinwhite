Rails.application.routes.draw do
  root 'resume#home'

  get    'password_resets/new'
  get    'password_resets/edit'
  get    'sessions/new'
  get    'resume'   => 'resume#index'
  get    'projects' => 'projects#index'
  get    'home'     => 'resume#index'
  get    'signup'   => 'users#new'
  get    'login'    => 'sessions#new'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
