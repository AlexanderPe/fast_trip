class CreateAviasalers < ActiveRecord::Migration
  def change
    create_table :aviasalers do |t|
      t.string :name
      t.integer :quantity
      t.timestamp :actual_time
      t.decimal :price
      t.integer :trip_id

      t.timestamps
    end
    add_index :aviasalers, [:trip_id, :created_at]
  end
end
