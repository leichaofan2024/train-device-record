class RenameColumnToRunningRecord < ActiveRecord::Migration[5.0]
  def change
    rename_column :running_records, :transfomer_id, :transformer_id
  end
end
