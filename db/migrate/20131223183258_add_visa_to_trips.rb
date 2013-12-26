class AddVisaToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :no_visa, :boolean
  end
end
