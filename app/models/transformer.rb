class Transformer < ApplicationRecord
  belongs_to :equipment_category
  belongs_to :factory
  belongs_to :station
  has_many :equipment_resumes 
end
