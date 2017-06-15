class AddModelsToTransformer < ActiveRecord::Migration[5.0]
  def change
    create_table :running_records do |t|
      t.integer :transfomer_id
      t.string :year                  #年度
      t.string :operation_hours            #运行小时
      t.string :overload_times             #过负荷次数
      t.string :overload_cumulative_time             #过载时间
      t.string :utilize_percentage              # 利用率
      t.string :short_circuit_time                     #短路次数
      t.string :record          #纪事
      t.timestamps
    end

    create_table :quanlity_authanticate_records do |t|
      t.integer :transformer_id
      t.string :year                  #年度
      t.string :grade            #等级
      t.string :major_defects            #主要缺陷
      t.timestamps
    end

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

    create_table :transformer_shift_records do |t|
      t.integer :transformer_id
      t.date :shift_in_date              #迁入日期
      t.string :shift_reason                    #移设原因
      t.string :shift_out_company        #移交单位
      t.date   :shift_out_agent          #移交方经办人
      t.string :reciving_company       #接收单位
      t.string  :shift_in_agent                #接收方经办人
      t.date   :commissioning_date       #投运日期
      t.string :breakdown_record           #故障记录
      t.timestamps
    end
  end
end
