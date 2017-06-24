class CircuitBreaker < ApplicationRecord
  belongs_to :equipment_category
  belongs_to :factory
  belongs_to :station
end
