Rails.application.routes.draw do
  get '/about', to: 'pages#about'
  
  resources :courses do
    resources :lessons, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  resources :lessons, except: [:index, :new, :create] do
    resources :discussions, only: [:index, :new, :create]
  end
  resources :discussions, except: [:index, :new, :create]
  resources :enrollments
  resources :users

  root to: 'courses#index'
end
