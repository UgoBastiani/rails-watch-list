Rails.application.routes.draw do
  resources :lists, only: [:new, :create, :show, :index] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
  root to: "lists#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
