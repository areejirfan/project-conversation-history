Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root "projects#index"
  resources :projects do 
    resources :comments, only: [:create, :destroy]
  end
end
