class Aviasaler < ActiveRecord::Base
  attr_accessible :actual_time, :name, :price, :quantity, :trip_id

  belongs_to :trip

end