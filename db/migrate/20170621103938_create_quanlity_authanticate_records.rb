class CreateQuanlityAuthanticateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :quanlity_authanticate_records do |t|
      t.integer :transformer_id
      t.string :year                  #年度
      t.string :grade            #等级
      t.string :major_defects            #主要缺陷
      t.timestamps
    end
  end
end
