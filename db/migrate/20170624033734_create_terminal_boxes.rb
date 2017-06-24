class CreateTerminalBoxes < ActiveRecord::Migration[5.0]
    def change
        create_table :terminal_boxes do |t|
            t.integer :station_id
            t.integer :equipment_category_id    #
            t.integer :factory_id               #
            t.string :running_number            # 运行编号
            t.string :main_equipment # 主要设备构成
            t.string :category # 类型
            t.string :environment # 工作环境
            t.date :manufacture_date # 出厂日期
            t.date   :commissioning_date        # 投运日期
            t.string :remark                    # 备注

            t.timestamps
        end
    end
end
