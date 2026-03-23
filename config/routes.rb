Rails.application.routes.draw do
  root "pages#home"

  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: "sessions#failure"
  delete "sign_out", to: "sessions#destroy"

  resources :submissions, only: [ :new, :create, :update ] do
    resource :vote, only: [ :create, :destroy ]
  end

  get "admin", to: "admin#index"
  get "admin/export", to: "admin#export"
  post "admin/:id/toggle_discard", to: "admin#toggle_discard", as: :admin_toggle_discard

  get "up" => "rails/health#show", as: :rails_health_check
end
