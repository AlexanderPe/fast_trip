class Hotel < ActiveRecord::Base
  attr_accessible :description, :five_stars, :name
  belongs_to :trip

end
