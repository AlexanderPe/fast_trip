class Aviasaler < ActiveRecord::Base
  attr_accessible :actual_time, :name, :price, :quantity

  belongs_to :trip

  validates :trip_id, presence: true
end
