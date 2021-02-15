class CreatePhacaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :phacase_records do |t|

      t.timestamps
    end
  end
end
