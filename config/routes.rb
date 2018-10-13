Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  # get 'users/new' , as: 'signup'
  get  '/signup',   to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :time_cards do
    member do
      patch :add, :subtract, :updata
      post :update
    end
  end
  
  resources :users 
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  
  resources :monthly_authentications, only: [:update, :create] 
  # do
  #   collection do
  #     patch :update_monthly_authentication
  #   end
  # end
  patch '/monthly_authentications', to: 'monthly_authentications#monthly_update'
  
end
