Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    devise_for :users, controllers: { registrations: 'users/registrations' , sessions: 'users/sessions'}

    root 'welcome#index'

    namespace :users do
      resources :users
    end

    resources :stations do
        member do
          get :station_users
        end
        collection do
            post :category_new
        end
    end




    resources :factories
    resources :equipment_categories do
      namespace :equipments do
        resources :circuit_breakers
        resources :isolate_switches
        resources :load_switches
        resources :apparatus_composites
        resources :current_transformers
        resources :potential_transformers
        resources :lightning_rods
        resources :ray_resistance_rings
        resources :cable_ones
        resources :busbars
        resources :discharging_devices
        resources :gis_cupboards
        resources :low_voltage_cabinets
        resources :integrated_automation_systems
        resources :failure_judgment_devices
        resources :remote_action_systems
        resources :v_stop_systems
        resources :other_tran_equipments
        resources :surge_arresters
        resources :power_supplies
        resources :batteries
        resources :insulation_devices
        resources :trends_valve_controllables
        resources :trends_regulating_transformers
        resources :trends_discharge_coils
        resources :trends_inductors
        resources :trends_shunt_capacitors
        resources :discharge_coils
        resources :inductors
        resources :shunt_capacitors
        resources :video_monitoring_systems
        resources :terminal_boxes
        resources :transformers do
            resources :quanlity_authanticate_records
            resources :maintenance_records
            resources :transformer_shift_records
            resources :move_records
        end
      end
      collection do
          get :admin_index
      end
    end



end
