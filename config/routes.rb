Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'

  get    'home'     => 'static_pages#home'
  get    'signup'   => 'users#new'
  get    'login'    => 'sessions#new'
  get    'about'    => 'static_pages#about'
  get    'contact'  => 'static_pages#contact'
  get    'articles' => 'static_pages#articles'
  post   'login'    => 'sessions#create'
  delete 'logout'   => 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
