class CreateStationEquipmentShips < ActiveRecord::Migration[5.0]
  def change
    create_table :station_equipment_ships do |t|
      t.integer :station_id
      t.integer :equipment_category_id
      t.timestamps
    end
  end
end
