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
  before_save { create_secure_token(:remember_token) }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def send_password_reset
    create_secure_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(validate: false)
    UserMailer.password_reset(self).deliver
  end

  private

    def create_secure_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

end