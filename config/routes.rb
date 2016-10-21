Rails.application.routes.draw do
  resources :car_models, only: :index

  root "home#index"
end
