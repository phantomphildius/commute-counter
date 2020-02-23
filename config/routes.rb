Rails.application.routes.draw do
  resources :logins, only: :index
  resources :oauths, only: :index
end
