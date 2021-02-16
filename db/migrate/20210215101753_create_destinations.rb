class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :post_code, null: false
      t.string :phone_number, null: false
      t.string :city, null: false
      t.string :building_name
      t.references :purchase_records, null: false, foreign_key: true
      t.integer :shipping_area_id, null: false
      t.timestamps
    end
  end
end
