class CreateRayResistanceRings < ActiveRecord::Migration[5.0]
  def change
    create_table :ray_resistance_rings do |t|

      t.timestamps
    end
  end
end
