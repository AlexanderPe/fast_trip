class UserMailer < ActionMailer::Base
  default from: "i.n.buryan@gmail.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

  def registration_confirmation(user)
    @user = user
    mail :to => user.email, :subject => "Registration confirmation"
  end
end