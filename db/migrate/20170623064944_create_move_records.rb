class CreateMoveRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :move_records do |t|
      t.date    :year
      t.string  :operation
      t.string  :overload_time
      t.string  :overload_cumulative_time
      t.string  :utilize_percentage
      t.string  :short_circuit_time
      t.string  :run_record
      t.timestamps
    end
  end
end
