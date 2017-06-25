class AddColumnToMoveRecord < ActiveRecord::Migration[5.0]
  def change
    add_column :move_records, :transformer_id, :integer
  end
end
