class CreateHotelsalers < ActiveRecord::Migration
  def change
    create_table :hotelsalers do |t|
      t.string :name
      t.integer :quantity
      t.timestamp :actual_time
      t.decimal :price_one
      t.decimal :price_two
      t.integer :trip_id

      t.timestamps
    end
    add_index :hotelsalers, [:trip_id, :created_at]
  end
end
