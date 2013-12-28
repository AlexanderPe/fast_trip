class Hotel < ActiveRecord::Base
  attr_accessible :description, :five_stars, :name, :address
  belongs_to :trip

end
