# Rails.application.routes.draw do
#   # devise_for :users
#   # ActiveAdmin.routes(self)

#   resources :courses do
#     resources :lessons do
#       resources :discussions
#     end
#   end

#   resources :enrollments
#   resources :users

#   # get 'about', to: 'static_pages#about'
#   
# end


Rails.application.routes.draw do
  resources :courses do
    resources :lessons, only: [:index, :new, :create]
  end
  resources :lessons, except: [:index, :new, :create] do
    resources :discussions, only: [:index, :new, :create]
  end
  resources :discussions, except: [:index, :new, :create]
  resources :enrollments
  resources :users

  root to: 'courses#index'
end
