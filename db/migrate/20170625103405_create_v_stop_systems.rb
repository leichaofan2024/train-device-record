class CreateVStopSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :v_stop_systems do |t|
      t.integer :station_id
      t.integer :equipment_category_id    #
      t.integer :factory_id               #
      t.string :standard                  # 规格型号
      t.integer :wen_control_number # 温控柜数量
      t.integer :control_number # 控制群数量
      t.date :manufacture_date # 出厂日期
      t.date   :commissioning_date        # 投运日期
      t.string :remark                    # 备注
      t.timestamps
    end
  end
end
