Rails.application.routes.draw do
  # devise_for :users
  # ActiveAdmin.routes(self)

  resources :courses do
    resources :lessons do
      resources :discussions
    end
  end

  resources :enrollments
  resources :users

  # get 'about', to: 'static_pages#about'
  root to: 'courses#index'
end
