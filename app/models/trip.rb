class Trip < ActiveRecord::Base
  attr_accessible :content, :image, :title, :aviasalers_attributes, :tickets_attributes

  has_many :aviasalers, dependent: :destroy
  has_many :tickets, dependent: :destroy
  accepts_nested_attributes_for :aviasalers, allow_destroy: true, :reject_if => lambda { |a| a.blank? }
  accepts_nested_attributes_for :tickets, allow_destroy: true, :reject_if => lambda { |a| a.blank? }

  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence:   true
  validates :content, presence:   true
  validates :image, presence:   true

  default_scope order: 'trips.created_at DESC'

  mount_uploader :image, ImageUploader
end