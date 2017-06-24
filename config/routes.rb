Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root "welcome#index"
  resources :stations do

    collection do
      post :category_new
    end
  end


  resources :factories
  resources :equipment_categories do
    resources :circuit_breakers
    resources :isolate_switches
    resources :load_switches
    resources :composite_apparatus
    resources :current_transformers
    resources :potential_transformers
    resources :transformers do
      resources :quanlity_authanticate_records
      resources :maintenance_records
      resources :transformer_shift_records
      resources :move_records
    end
    collection do
      get :admin_index
    end
  end


end
