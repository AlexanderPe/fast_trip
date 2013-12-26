class AddCityAndCountryToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :city, :string
    add_column :trips, :country, :string
  end
end
