class CoursesController < ApplicationController
  layout 'users'

  def index
    @user = User.find(session[:user_id])
    @courses = @user.courses.all
  end

  def new
    @user = User.find(session[:user_id])
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = session[:user_id]
    if @course.save
      flash[:success] = "#{@course.name} added successfully"
      redirect_to user_courses_path
    else
      if @course.errors
        flash[:danger] = ''
        @course.errors.full_messages.each do |message|
          flash[:danger] << message + '.  '
        end
      end
      redirect_to new_user_course_path
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      redirect_to user_courses_path(User.find(session[:user_id]).id)
      flash[:success] = "#{@course.name} updated successfully"
    else
      flash[:danger] = "#{@course.name} could not be updated"
      redirect_to edit_user_course_path
    end
  end

  def destroy
    course = Course.find(params[:id])
    flash[:success] = "#{course.name} deleted successfully"
    course.destroy
    redirect_to user_courses_path(User.find(session[:user_id]).id)
  end

  private

  def course_params
    params.require(:course).permit(:name, :building_id)
  end
end
