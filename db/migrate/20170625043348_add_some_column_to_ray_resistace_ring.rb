class AddSomeColumnToRayResistaceRing < ActiveRecord::Migration[5.0]
    def change
        add_column :ray_resistance_rings, :station_id, :integer
        add_column :ray_resistance_rings, :equipment_category_id, :integer
        add_column :ray_resistance_rings, :factory_id, :integer
    end
end
