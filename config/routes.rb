Rails.application.routes.draw do
  devise_for :users
  get "home/index", to: "home#index", as: "home_index"
  root to: "home#index"
  resources :races, :events
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
