class CreateTrendsRegulatingTransformers < ActiveRecord::Migration[5.0]
    def change
        create_table :trends_regulating_transformers do |t|
            t.integer :station_id
            t.integer :equipment_category_id    #
            t.integer :factory_id               #
            t.string :running_number            # 运行编号
            t.string :standard                  # 规格型号
            t.string :rated_voltage             # 额定电压
            t.string :rated_current             # 额定电流
            t.string :capacity # 容量
            t.string :insulation_oil            # 绝缘油号
            t.string :total_weight              # 总重
            t.date   :manufacture_date          # 出厂日期
            t.string :manufacture_number        # 出厂序号
            t.date   :commissioning_date        # 投运日期
            t.string :remark                    # 备注

            t.timestamps
        end
    end
end
