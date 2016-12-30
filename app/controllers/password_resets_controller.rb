class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  layout 'users_static'

  def new
  end

  def create
    @user = User.where(email: params[:password_reset][:email].downcase).first
    unless @user
      flash.now[:danger] = "Email address not found"
      render 'new'
      return
    end
    if @user && @user.activated?
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:success] = "Password reset link sent to #{@user.email}"
      redirect_to root_url
    else
      flash.now[:danger] = "Account not activated"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      flash[:success] = "Password has been reset."
      redirect_to users_login_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless (@user && @user.activated? &&
            @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end

end
