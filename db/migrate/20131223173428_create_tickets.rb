class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :departure_city
      t.string :departure_code
      t.timestamp :departure_time
      t.string :arrival_city
      t.string :arrival_code
      t.timestamp :arrival_time
      t.string :aviacompany
      t.string :flight
      t.integer :trip_id

      t.timestamps
    end
    add_index :tickets, [:trip_id, :created_at]
  end
end
