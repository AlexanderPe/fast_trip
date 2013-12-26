class Trip < ActiveRecord::Base

  attr_accessible :content, :image, :title, :city, :country, :aviasalers_attributes, :hotelsalers_attributes, :hotels_attributes, :tickets_attributes, :no_visa
  has_many :aviasalers, :dependent => :destroy
  has_many :hotels, :dependent => :destroy
  has_many :tickets, :dependent => :destroy
  has_many :hotelsalers, :dependent => :destroy

  accepts_nested_attributes_for :aviasalers, :reject_if => lambda { |a| a.blank? }
  accepts_nested_attributes_for :hotels, :reject_if => lambda { |a| a.blank? }
  accepts_nested_attributes_for :tickets, :reject_if => lambda { |a| a.blank? }
  accepts_nested_attributes_for :hotelsalers, :reject_if => lambda { |a| a.blank? }
  validates :title, presence: true, length: { maximum: 34 }
  validates :image, presence: true
  validates :content, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :user_id, presence: true

  default_scope order: 'trips.created_at DESC'

  mount_uploader :image, ImageUploader


  def trip_sum
    @trip.aviasalers.sum(:price) + @trip.hotelsalers.sum(:price_one)
  end

end