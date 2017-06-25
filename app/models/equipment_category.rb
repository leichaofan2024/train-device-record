class EquipmentCategory < ApplicationRecord

    has_many :station_equipment_ships
    has_many :stations, through: :station_equipment_ships
    has_many :transformers
    has_many :circuit_breakers
    has_many :isolate_switches
    has_many :load_switches
    has_many :apparatus_composites
    has_many :current_transformers
    has_many :potential_transformers

    has_many :lightning_rods
    has_many :ray_resistance_rings
    has_many :cable_ones
    has_many :busbars
    has_many :discharging_devices
    has_many :gis_cupboards
    has_many :low_voltage_cabinets
    has_many :integrated_automation_systems
    has_many :failure_judgment_devices
    has_many :remote_action_systems
    has_many :v_stop_sies
    has_many :terminal_boxes
    has_many :video_monitoring_systems
    has_many :other_tran_equipments
    has_many :surge_arresters
    has_many :power_supplies
    has_many :batteries
    has_many :insulation_devices
    has_many :trends_valve_controllables
    has_many :trends_regulating_transformers
    has_many :trends_discharge_coils
    has_many :trends_inductors
    has_many :trends_shunt_capacitors
    has_many :discharge_coils
    has_many :inductors
    has_many :shunt_capacitors
    has_many :other_tran_equipments
    has_many :video_monitoring_systems
    has_many :terminal_boxes

end
