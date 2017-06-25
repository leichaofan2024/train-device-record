class RenameColumnToMoveRecord < ActiveRecord::Migration[5.0]
  def change
    rename_column :move_records, :operation, :operation_hours
  end
end
