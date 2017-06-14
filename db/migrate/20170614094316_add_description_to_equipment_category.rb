class AddDescriptionToEquipmentCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment_categories, :description, :string
  end
end
