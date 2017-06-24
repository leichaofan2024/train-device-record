class CreateTransformerShiftRecords < ActiveRecord::Migration[5.0]
  def change
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
