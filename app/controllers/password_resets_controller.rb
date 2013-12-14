class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
    if user
  	  user.send_password_reset 
  	  redirect_to signin_url, :notice => "Email sent with password reset instructions."
    else
      flash.now[:error] = 'User with such email is not found'
      render 'new'
    end
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
  	@user = User.find_by_password_reset_token!(params[:id])
  	if @user.password_reset_sent_at < 2.hours.ago
    	redirect_to new_password_reset_path, :alert => "Password &crarr; 
      reset has expired."
  	elsif @user.update_attributes(params[:user])
    	redirect_to signin_url, :notice => "Password has been reset."
  	else
    	render :edit
  	end
  end
end
