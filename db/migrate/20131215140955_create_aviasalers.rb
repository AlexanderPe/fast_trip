class CreateAviasalers < ActiveRecord::Migration
  def change
    create_table :aviasalers do |t|
      t.string :name
      t.integer :quantity
      t.timestamp :actual_time
      t.decimal :price

      t.timestamps
    end
  end
end
