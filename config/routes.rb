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
    resources :transformers do
      resources :running_records
      resources :quanlity_authanticate_records
      resources :maintenance_records
      resources :transformer_shift_records
    end
    collection do
      get :admin_index
    end
  end


end
