class CreateEquipmentResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment_resumes do |t|
      
      t.timestamps
    end
  end
end
