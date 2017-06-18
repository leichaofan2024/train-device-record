Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  root "welcome#index"
  resources :stations do
    collection do
      post :category_new
    end
    member do
      post :transformer_new
    end
  end


  resources :factories
  resources :equipment_categories do
    collection do
      get :admin_index
    end 
    resources :transformers do
      resources :equipment_resumes
    end
  end


end
