class CreateIntegratedAutomationSystems < ActiveRecord::Migration[5.0]
    def change
        create_table :integrated_automation_systems do |t|
            t.integer :station_id
            t.integer :equipment_category_id    #
            t.integer :factory_id               #
            t.string :standard                  # 规格型号
            t.string :manufacture_number        # 出厂序号
            t.date   :manufacture_date          # 出厂日期
            t.date   :commissioning_date        # 投运日期
            t.string :remark                    # 备注

            t.timestamps
        end
    end
end
