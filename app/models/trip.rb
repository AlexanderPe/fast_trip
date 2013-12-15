class Trip < ActiveRecord::Base
  attr_accessible :content, :image, :title
  has_many :aviasalers, dependent: :destroy
  accepts_nested_attributes_for :aviasalers
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence:   true
  validates :content, presence:   true
  validates :image, presence:   true

  default_scope order: 'trips.created_at DESC'

  mount_uploader :image, ImageUploader
end