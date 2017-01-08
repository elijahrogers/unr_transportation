class UsersController < ApplicationController
  before_action :confirm_logged_in, only: :main
  layout 'users_static', except: :main
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Activation link sent to #{@user.email}"
      redirect_to root_url
    else
      format_errors if @user.errors
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Account Successfully Updated'
      redirect_to users_main_path
    else
      flash[:danger] = 'Account could not be updated'
      redirect_to edit_user_path(@user)
    end
  end

  # def destroy
  #   session[:email] = nil
  #   session[:user_id] = nil
  #   user = User.find(params[:id]).destroy
  #   redirect_to root_path
  # end

  def login
  end

  def main
    @pass = ''
    find_available_zones
    @user = User.find(session[:user_id])
    add_courses
    render layout: 'users'
  end

  def logout
    flash[:success] = "Bye #{current_user.first_name}"
    session[:email] = nil
    session[:user_id] = nil
    redirect_to root_url
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user && found_user.activated
        authorized_user = found_user.authenticate(params[:password])
      else
        flash[:notice] = 'Account not activated'
        redirect_to users_login_path
        return
      end
    end
    if authorized_user
      flash[:success] = "Welcome #{authorized_user.first_name}!"
      session[:email] = authorized_user.email
      session[:user_id] = authorized_user.id
      redirect_to users_main_path
    else
      flash[:danger] = 'Inlvaid email or password'
      redirect_to users_login_path
    end
  end

  def format_errors
    flash[:danger] = 'The following errors were found: '
    flash[:danger] += @user.errors.full_messages.to_sentence.downcase
  end

  def add_courses
    @courses = []
    @user.courses.each { |c| @courses << format_course(c) }
  end

  def current_user
    return unless session[:user_id]
    User.find(session[:user_id])
  end

  private

  def confirm_logged_in
    return true if session[:email]
    redirect_to users_login_path
    false
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
