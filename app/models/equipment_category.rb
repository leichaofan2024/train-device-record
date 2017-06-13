class EquipmentCategory < ApplicationRecord
  has_many :station_equipment_ships
  has_many :stations, through: :station_equipment_ships
  has_many :transformers
  
end
