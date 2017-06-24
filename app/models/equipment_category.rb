class EquipmentCategory < ApplicationRecord
  has_many :station_equipment_ships
  has_many :stations, through: :station_equipment_ships
  has_many :transformers
  has_many :circuit_breakers
  has_many :isolate_switches
  has_many :load_switches
  has_many :composite_apparatus
  has_many :current_transformers
  has_many :potential_transformers
end
