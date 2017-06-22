class CreateWorkingRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :working_records do |t|
      t.integer :transformer_id
      t.string :year
      t.string :operation_hours
      t.string :overload_times
      t.string :overload_cumulative_time
      t.string :utilize_percentage
      t.string :short_circuit_time
      t.string :record         
      t.timestamps
    end
  end
end
