Rails.application.routes.draw do

  root to: 'toys#index'
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  end
  resources :toys
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
