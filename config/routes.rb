Rails.application.routes.draw do
  resources :users
  resources :articles
 
  get "about", to: "home#about"
  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"

end
