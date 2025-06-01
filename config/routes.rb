Rails.application.routes.draw do
  devise_for :users
  get "home/index", to: "home#index", as: "home_index"
  root to: "home#index"
  resources :events
  resources :races do
    resource :race_result, only: [ :new, :create, :edit, :update, :show ]
  end
  resources :race_result do
    resources :race_result_comments, only: [ :create, :destroy ]
  end
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  post "/races/:id/edit", to: "races#update"
end
