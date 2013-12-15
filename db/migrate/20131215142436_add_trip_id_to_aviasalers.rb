class AddTripIdToAviasalers < ActiveRecord::Migration
  def change
    add_column :aviasalers, :trip_id, :integer
  end
  add_index :aviasalers, [:trip_id, :created_at]
end
