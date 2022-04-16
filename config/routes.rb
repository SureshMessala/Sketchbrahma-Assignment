Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  # resources :projects
  # resources :tasks
  resources :projects do
    resources :tasks
  end
end
