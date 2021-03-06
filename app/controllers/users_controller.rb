class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:index, :destroy]
  before_filter :signed_in_user_filter, only: [:new, :create]
  
  def show
    if current_user == User.find(params[:id])
      @user = User.find(params[:id])
    else
      redirect_back_or current_user
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    user_to_delete = User.find(params[:id]).destroy
    if (current_user == user_to_delete) && (current_user.admin?)
      flash[:error] = "Cannot delete own admin account!"
    else  
      user_to_delete.destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
    end
  end


  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(signin_path) unless current_user?(@user)
    end
end