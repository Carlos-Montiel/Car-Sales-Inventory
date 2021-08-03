Rails.application.routes.draw do

  resources :cars
  resources :dealerships
  devise_for :users

  devise_scope :user do
  	authenticated :user do
  	  root to: "cars#index"
  	end
  	unauthenticated do
  	  root 'devise/sessions#new', as: :unauthenticated_root
  	end
  end
end
