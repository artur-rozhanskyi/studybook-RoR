Rails.application.routes.draw do
  devise_for :users
  resources :trains do
    resources :carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_station, on: :member
  end
  resources :routes
  resource :search, only: [:show]
  resources :tickets
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
