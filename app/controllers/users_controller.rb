class UsersController < ApplicationController

  layout 'users_static'

  before_action :confirm_logged_in, only: :main

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(action: 'main')
    else
      redirect_to(action: 'new')
    end
  end

  def edit
  end

  def delete
  end

  def login
  end

  def main
    @user_email = User.find(session[:user_id]).email
    render :layout => 'users'
  end

  def logout
    session[:email] = nil
    session[:user_id] = nil
    redirect_to(controller: 'application', action: 'main')
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      session[:email] = authorized_user.email
      session[:user_id] = authorized_user.id
      redirect_to(action: 'main')
    else
      redirect_to(action: 'login')
    end
  end

  private

  def confirm_logged_in
    unless session[:email]
      redirect_to(action: 'login')
      return false
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
