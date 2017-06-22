class CreateRunningRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :running_records do |t|
      t.integer :transformer_id
      t.string :year                  #年度
      t.string :operation_hours            #运行小时
      t.string :overload_times             #过负荷次数
      t.string :overload_cumulative_time             #过载时间
      t.string :utilize_percentage              # 利用率
      t.string :short_circuit_time                     #短路次数
      t.string :record          #纪事

      t.timestamps
    end
  end
end
