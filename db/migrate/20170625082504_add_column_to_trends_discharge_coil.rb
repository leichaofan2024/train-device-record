class AddColumnToTrendsDischargeCoil < ActiveRecord::Migration[5.0]
  def change
    add_column :trends_discharge_coils, :remark, :string 
  end
end
