class Station < ApplicationRecord
  has_many :station_equipment_ships
  has_many :equipment_categories, through: :station_equipment_ships
  has_many :transformers
  has_many :users
  
end
