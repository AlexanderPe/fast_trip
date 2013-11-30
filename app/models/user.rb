# == Schema Information
#
# Table name: users
#
#  id         				:integer         not null, primary key
#  email      				:string(255)
#  password 				:string(minimum: 6)
#  password_confirmation 	:string
#  created_at 				:datetime
#  updated_at 				:datetime

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end