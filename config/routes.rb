Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [ :show, :index, :edit, :update ], path: "users"
  get "home/index", to: "home#index", as: "home_index"
  root to: "home#index"
  resources :events
  resources :races do
    collection do
      get "discover"
    end
    resource :race_result, only: [ :new, :create, :edit, :update, :show ]
    resource :stay_plan, only: [ :new, :create, :edit, :update, :show ]
  end
  resources :race_result do
    resources :race_result_comments, only: [ :create, :destroy ]
  end
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  post "/races/:id/edit", to: "races#update"
  resources :items, only: [ :new, :create, :index, :edit, :update, :destroy ] do
  end
end
