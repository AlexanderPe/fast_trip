class Aviasaler < ActiveRecord::Base
  attr_accessible :actual_time, :name, :price, :quantity, :back_side
  belongs_to :trip

end
