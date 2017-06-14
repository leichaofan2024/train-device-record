class AddTransformerIdToEpuipmentResume < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment_resumes, :transformer_id, :integer
  end
end
