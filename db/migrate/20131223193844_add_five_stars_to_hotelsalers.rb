class AddFiveStarsToHotelsalers < ActiveRecord::Migration
  def change
    add_column :hotelsalers, :five_stars, :boolean
  end
end
