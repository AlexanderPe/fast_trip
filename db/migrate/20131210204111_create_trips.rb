class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.string :content
      t.string :image
      t.integer :user_id

      t.timestamps
    end
    add_index :trips, [:user_id, :created_at]
  end
end
