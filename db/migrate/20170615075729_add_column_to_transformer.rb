class AddColumnToTransformer < ActiveRecord::Migration[5.0]
  def change
    add_column :transformers, :tapping_switch, :string      #分接开关
    add_column :transformers, :lowside_current, :float      #低压侧电流
    add_column :transformers, :lowside_voltage, :float      #低压侧电压
    add_column :transformers, :highside_current, :float     #高侧压电流
    add_column :transformers, :highside_voltage, :float     #高压侧电压
    add_column :transformers, :ancillary_device, :string    #附属装置
  end
end
