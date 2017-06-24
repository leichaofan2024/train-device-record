class CreateLightningRods < ActiveRecord::Migration[5.0]
    def change
        create_table :lightning_rods do |t|
            t.integer :station_id
            t.integer :equipment_category_id    #
            t.integer :factory_id               #
            t.string :running_number            # 运行编号
            t.string :standard # 规格型号
            t.string :height # 高度
            t.string :category # 类型
            t.date :manufacture_date # 出厂日期
            t.date   :commissioning_date        # 投运日期
            t.string :remark                    # 备注

            t.timestamps
        end
    end
end
