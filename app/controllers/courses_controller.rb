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
      redirect_to(action: 'new')
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(:name, :building_id)
  end
end
