class CreateSurgeArresters < ActiveRecord::Migration[5.0]
    def change
        create_table :surge_arresters do |t|
            t.integer :station_id
            t.integer :equipment_category_id    #
            t.integer :factory_id               #
            t.string :running_number            # 运行编号
            t.string :standard                  # 规格型号
            t.string :rated_voltage             # 额定电压
            t.string :casing # 套管材质
            t.date :manufacture_date # 出厂日期
            t.date   :commissioning_date # 投运日期
            t.string :category # 类型
            t.string :remark # 备注

            t.timestamps
        end
    end
end
