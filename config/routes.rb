Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "stations#index"
  resources :stations
  resources :factories
  resources :equipment_categories do
     resources :transformers
  end


end
