class Ticket < ActiveRecord::Base
  attr_accessible :arrival_city, :arrival_code, :arrival_time, :aviacompany, :departure_city, :departure_code, :departure_time, :flight, :back_side
  
  belongs_to :trip
end

