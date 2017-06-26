class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email,:string, default: "", null: true
  end
end
