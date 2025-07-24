Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :widgets, only: [ :show, :index, :new, :create ]
  resources :widget_ratings, only: [ :create ]
  if Rails.env.development?
    resources :design_system_docs, only: [ :index ]
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  get "manufacturers/:id", to: "manufacturers#show"

  ####
  # Custom routes start here
  #
  # For each new custom route:
  #
  # * Be sure you have the canonical route declared above
  # * Add the new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything else non-standard

  # used in podcast ads for the 'amazing' campaign
  get "/amazing", to: redirect("/widgets")
end
