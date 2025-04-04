Rails.application.routes.draw do
  resources :articles
  get "about", to: "home#about"
  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"
  get "signup", to: "users#new"
  get 'users/:id/edit', to: 'users#edit'
  patch 'users/:id', to: 'users#update'
  resources :users, except: [:new]

end
