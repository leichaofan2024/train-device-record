class CreateDischargingDevices < ActiveRecord::Migration[5.0]
    def change
        create_table :discharging_devices do |t|
            t.integer :station_id
            t.integer :equipment_category_id    #
            t.integer :factory_id               #
            t.string :standard                  # 规格型号
            t.string :running_number            # 运行编号
            t.string :voltage # 工频电压（KV）
            t.string :ability # 自灭弧能力（KA）
            t.string :c_ability # 承受短路电流能力
            t.date   :manufacture_date          # 出厂日期
            t.date   :commissioning_date        # 投运日期
            t.string :remark                    # 备注

            t.timestamps
        end
    end
end
