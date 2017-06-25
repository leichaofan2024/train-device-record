class AddColumnToRayResistanceRing < ActiveRecord::Migration[5.0]
    def change
        add_column :ray_resistance_rings, :running_number, :string # 运行编号
        add_column :ray_resistance_rings, :name, :string # 设备名称
        add_column :ray_resistance_rings, :standard, :string # 规格型号
        add_column :ray_resistance_rings, :rated_voltage, :string # 额定电压
        add_column :ray_resistance_rings, :manufacture_date, :date # 出厂日期
        add_column :ray_resistance_rings, :manufacture_number, :string # 出厂序号
        add_column :ray_resistance_rings, :commissioning_date, :date # 投运日期
        add_column :ray_resistance_rings, :remark, :string # 备注
      end
end
