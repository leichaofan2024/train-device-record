class CreateTransformers < ActiveRecord::Migration[5.0]
  def change
    create_table :transformers do |t|
      t.integer :equipment_category_id    #
      t.integer :factory_id               #
      t.string :standard                  #规格型号
      t.string :running_number            #运行编号
      t.string :rated_voltage             #额定电压
      t.string :rated_current             #额定电流
      t.string :rated_volume              #额定电容
      t.string :phase                     #相数
      t.string :connection_group          #接线组别
      t.string :cooling_method            #冷却方式
      t.string :noload_current            #空载电流
      t.string :noload_loss               #空载损耗
      t.string :short_circuit_loss        #短路损耗
      t.string :impedance_voltage         #阻抗电压
      t.string :insulation_oil            #绝缘油号
      t.string :oil_weight                #油重
      t.string :suttle                    #器身重
      t.string :affix_weight              #附件重
      t.string :total_weight              #总重
      t.string :status                    #状态
      t.date   :manufacture_date          #出厂日期
      t.string :manufacture_number        #出厂序号
      t.date   :installation_date         #安装日期
      t.date   :commissioning_date        #投运日期
      t.string :remark                    #备注
      t.timestamps
    end
  end
end
