require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  describe 'GET #index' do
    before do
      @user = create(:user)
      session[:user_id] = @user.id
      session[:email] = @user.email
      get :index, user_id: @user.id
    end
    it 'finds user' do
      expect(assigns[:user]).to eq(@user)
    end
    it 'finds user courses' do
      expect(assigns[:courses]).to eq(@user.courses.all)
    end
  end

  describe 'GET #new' do
    it 'finds user' do
      @user = create(:user)
      session[:user_id] = @user.id
      session[:email] = @user.email
      get :new, user_id: @user.id
      expect(assigns[:user]).to eq(@user)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      before do
        user = create(:user)
        session[:user_id] = user.id
        session[:email] = user.email
        @params = { user_id: user.id, course: attributes_for(:course) }
      end
      it 'creates course' do
        expect { post :create, @params }.to change(Course, :count).by(1)
      end
      it do
        post :create, @params
        should set_flash
      end
      it do
        post :create, @params
        should redirect_to user_courses_path
      end
    end
    context 'with invalid attributes' do
      before do
        user = create(:user)
        session[:user_id] = user.id
        session[:email] = user.email
        post :create, user_id: user.id, course: attributes_for(:invalid_course)
      end
      it { should set_flash }
      it { should redirect_to new_user_course_path }
    end
  end

  describe 'GET #edit' do
    it 'successfully finds course' do
      course = create(:course)
      get :edit, user_id: course.user.id, id: course.id
      expect(assigns[:course]).to eq(course)
    end
  end

  describe 'POST #update' do
    context 'with valid attributes' do
      before do
        @course = create(:course)
        session[:user_id] = @course.user.id
        session[:email] = @course.user.email
        post :update, user_id: @course.user.id, course: { name: 'updated name' }, id: @course.id
      end
      it 'finds course' do
        expect(assigns[:course]).to eq(@course)
      end
      it 'updates course' do
        expect(Course.where(id: @course.id).first.name).to eq('updated name')
      end
      it { should redirect_to user_courses_path }
      it { should set_flash }
    end
    context 'with invalid attributes' do
      before do
        @course = create(:course)
        session[:user_id] = @course.user.id
        session[:email] = @course.user.email
        post :update, user_id: @course.user.id, course: { name: nil }, id: @course.id
      end
      it { should set_flash }
      it { should redirect_to edit_user_course_path}
    end
  end

  describe 'GET #destroy' do
    before do
      @course = create(:course)
      session[:user_id] = @course.user.id
      session[:email] = @course.user.email
      get :destroy, { user_id: @course.user_id, id: @course.id }
    end
    it 'destroys course' do
      expect(Course.where(id: @course.id).first).to be_nil
    end
    it { should redirect_to user_courses_path }
  end
end
