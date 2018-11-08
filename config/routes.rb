Rails.application.routes.draw do

  root to: 'toys#index'
  devise_for :users
  resources :toys do
    resources :bookings
  end
  get 'bookings', to: 'bookings#index', as: :bookings
  resources :users, only: [:show, :edit]
end
