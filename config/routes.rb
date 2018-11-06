Rails.application.routes.draw do

  root to: 'toys#index'
  devise_for :users
  resources :toys do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :bookings
  end
  get 'bookings', to: 'bookings#index', as: :bookings
end
