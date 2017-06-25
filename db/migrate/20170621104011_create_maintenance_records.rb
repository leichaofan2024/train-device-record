class CreateMaintenanceRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :maintenance_records do |t|
      t.integer :transformer_id
      t.string :date               #日期
      t.string :maintenance_process       #维程
      t.string :maintenance_unit         #承修单位
      t.string :cost            #费用
      t.string :overhaul_incharge                #检修负责人
      t.string :major_defects            #主要缺陷
      t.string :maintenance_situation              #修理情况
      t.timestamps
    end
  end
end
