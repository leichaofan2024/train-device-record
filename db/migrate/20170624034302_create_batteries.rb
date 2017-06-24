class CreateBatteries < ActiveRecord::Migration[5.0]
    def change
        create_table :batteries do |t|
            t.integer :station_id
            t.integer :equipment_category_id    #
            t.integer :factory_id               #
            t.string :standard                  # 规格型号
            t.string :number # 组数
            t.string :rated_voltage # 整组额定电压
            t.string :single_voltage # 单只额定电压
            t.string :rated_capacity           # 额定容量
            t.string :category                 # 类型
            t.date   :manufacture_date          # 出厂日期
            t.date   :commissioning_date        # 投运日期
            t.string :remark                    # 备注

            t.timestamps
        end
    end
end
