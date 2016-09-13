class CoursesController < ApplicationController
  layout 'users_static'

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
      flash[:notice] = 'Course Added Successfully'
      redirect_to(action: 'index')
    else
      if @course.errors
        flash[:notice] = ''
        @course.errors.full_messages.each do |message|
          flash[:notice] << message + '  '
        end
      end
      redirect_to(action: 'new')
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      redirect_to user_courses_path(User.find(session[:user_id]).id)
      flash[:notice] = 'Course Updated Successfully'
    else
      flash[:notice] = 'Course could not be updated'
      redirect_to(action: 'edit')
    end
  end

  def destroy
    # flash[:notice] = "#{course.name} Deleted Successfully"
    course = Course.find(params[:id]).destroy
    redirect_to user_courses_path(User.find(session[:user_id]).id)
  end

  private

  def course_params
    params.require(:course).permit(:name, :building_id)
  end
end
