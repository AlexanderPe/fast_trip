class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :description
      t.boolean :five_stars
      t.integer :trip_id

      t.timestamps
    end
    add_index :hotels, [:trip_id, :created_at]
  end
end
