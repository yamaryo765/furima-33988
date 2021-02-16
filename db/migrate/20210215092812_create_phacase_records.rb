class CreatePhacaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :phacase_records do |t|
      t.references :use,   null: false,foreign_key: true
      t.references :item,  null: false,foreign_key: true


      t.timestamps
    end
  end
end
