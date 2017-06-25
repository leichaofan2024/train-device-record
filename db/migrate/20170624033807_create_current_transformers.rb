class CreateCurrentTransformers < ActiveRecord::Migration[5.0]
  def change
    create_table :current_transformers do |t|
      t.integer :station_id
      t.integer :equipment_category_id    #
      t.integer :factory_id               #
      t.string :running_number            #运行编号
      t.string :standard                  #规格型号
      t.string :rated_voltage             #额定电压
      t.string :rated_current             #额定电流
      t.string :insulation_oil            #绝缘油号
      t.string :total_weight              #总重
      t.string :current_persent       #电流比
      t.string :first_class_coil                  #线圈一等级
      t.string :first_coil_load                     #线圈一等级负荷
      t.string :second_class_coil                  #线圈二等级
      t.string :second_coil_load                   #线圈二等级负
      t.string :status                    #状态
      t.date   :manufacture_date          #出厂日期
      t.string :manufacture_number        #出厂序号
      t.date   :commissioning_date        #投运日期
      t.string :remark                    #备注
      t.string :category_one        #设备分类一
      t.string :category_two        #设备分类二
      t.string :year                  #年度
      t.timestamps
    end
  end
end
