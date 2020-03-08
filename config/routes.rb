Rails.application.routes.draw do
    devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }, skip: [:sessions]

  devise_scope :user do
    get 'sign_in', to: 'user_sessions#new', as: :new_user_session
    delete 'sign_out', to: 'user_sessions#destroy', as: :destroy_user_session
  end

  root to: "dashboards#index"

  resources :dashboards, only: :index

  namespace :commute do
    resources :fares, only: %i(create new)
    resources :gears, only: %i(create new)
    resources :activities, only: :index
    resources :savings, only: :index
  end

  namespace :strava do
    resources :webhooks, only: %i(index create)
  end
end
