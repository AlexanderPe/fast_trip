class Hotelsaler < ActiveRecord::Base
  attr_accessible :actual_time, :name, :price_one, :price_two, :quantity, :five_stars

  belongs_to :trip
end
