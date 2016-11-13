class UsersController < ApplicationController

  layout 'users_static', except: :main

  before_action :confirm_logged_in, only: :main

  def new
    @user = User.new
  end

  def create
    flash[:notice] = ''
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:notice] = "Please check your email to activate your account."
      redirect_to root_url
    else
      if @user.errors
        flash[:notice] = ''
        @user.errors.full_messages.each do |message|
          flash[:notice] << message + '  '
        end
      end
      redirect_to(action: 'new')
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'Account Successfully Updated'
      redirect_to users_main_path
    else
      flash[:notice] = 'Account could not be updated'
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    session[:email] = nil
    session[:user_id] = nil
    user = User.find(params[:id]).destroy
    redirect_to root_path
  end

  def login
  end

  def main
    @pass = ''
    find_available_zones
    @user = User.find(session[:user_id])
    @courses = []
    @user.courses.each do |course|
      building = Building.find(course.building_id)
      @courses.push([{name: course.name}, {lat: building.lat.to_f, lng: building.lng.to_f}])
    end
    @courses
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
      if found_user && found_user.activated
        authorized_user = found_user.authenticate(params[:password])
      else
        flash[:notice] = 'Account not activated'
        redirect_to users_login_path
        return
      end
    end
    if authorized_user
      flash[:notice] = 'Successfully Logged In'
      session[:email] = authorized_user.email
      session[:user_id] = authorized_user.id
      redirect_to(action: 'main')
    else
      flash[:notice] = 'Inlvaid email or password'
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
