Rails.application.routes.draw do
  resources :coaches, only: [:index, :show] do
    resources :appointments, only: [:new, :create] do
      collection do
        get :slots, to: "appointments#slots"
      end
    end
  end
  root 'coaches#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
