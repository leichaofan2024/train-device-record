class Transformer < ApplicationRecord
  belongs_to :equipment_category
  belongs_to :factory
  belongs_to :station
  has_many :quanlity_authanticate_records
  has_many :maintenance_records
  has_many :transformer_shift_records
  has_many :move_records
end
