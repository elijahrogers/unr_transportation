require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it { should use_before_action(:confirm_logged_in) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates new user' do
        expect { post :create, user: attributes_for(:user) }.to change(User, :count).by(1)
      end

      it do
        post :create, user: attributes_for(:user)
        should redirect_to(root_url)
      end
    end

    context 'with invalid attributes' do
      before { post :create, user: attributes_for(:invalid_user) }

      it { should set_flash }

      it { should redirect_to(action: :new) }
    end
  end

  describe 'GET #edit' do
    let(:user) { create(:user) }

    it 'returns http success' do
      get :edit, { id: user.id }, user_id: user.id
      expect(response).to have_http_status(:success)
    end

    it 'finds user' do
      get :edit, { id: user.id }, user_id: user.id
      expect(assigns['user']).to eq(user)
    end
  end

  describe 'POST #update' do
    context 'with valid attributes' do
      before do
        @user = create(:activated_user)
        session[:user_id] = @user.id
        session[:email] = @user.email
        put :update, id: @user.id, user: { last_name: 'Appleseed', password: @user.password }
        @user.reload
      end

      it 'updates user' do
        expect(@user.last_name).to eq('Appleseed')
      end

      it 'flashes success message on update' do
        expect(flash[:success]).to match('Success')
      end

      it { should redirect_to(action: :main) }
    end

    context 'with invalid attributes' do
      before do
        @user = create(:activated_user)
        session[:user_id] = @user.id
        session[:email] = @user.email
        put :update, id: @user.id, user: { last_name: nil }
        @user.reload
      end

      it { should redirect_to(action: :edit) }

      it { should set_flash }
    end
  end

  # describe 'DELETE #destroy' do
  #   before(:each) do
  #     @user = User.create({first_name: 'Johnny', last_name: 'Appleseed', email: 'jappleseed@example.com', password: 'password', activated: true})
  #     request.session[:user_id] = @user.id
  #     request.session[:email] = @user.email
  #   end
  #   it 'clears session data' do
  #     delete :destroy, id: @user.id
  #     expect(session[:user_id]).to eq(nil)
  #     expect(session[:email]).to eq(nil)
  #   end
  #   it 'destroys user' do
  #     expect{delete :destroy, :id => @user.id}.to change(User, :count).by(-1)
  #   end
  #   it do
  #     delete :destroy, id: @user.id
  #     should redirect_to(root_url)
  #   end
  # end

  describe 'GET #login' do
    it 'returns http success' do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #main' do
    before(:each) do
      course = create(:course)
      @user = course.user
      session[:email] = @user.email
      session[:user_id] = @user.id
      get :main
    end
    it 'sets pass to empty string' do
      expect(assigns['pass']).to eq('')
    end
    it 'finds user' do
      expect(assigns['user']).to eq(@user)
    end
    it 'finds user courses' do
      expect(assigns['courses'].to_s).to match('First Class')
    end
    it do
      should render_with_layout('users')
    end
  end

  describe 'GET #logout' do
    before(:each) do
      user = create(:user)
      request.session[:user_id] = user.id
      request.session[:email] = user.email
      get :logout, id: user.id
    end
    it 'clears session data' do
      expect(session[:user_id]).to eq(nil)
      expect(session[:email]).to eq(nil)
    end
    it { should redirect_to(root_url) }
  end

  describe 'POST #attempt_login' do
    context 'when activated with valid attributes' do
      before(:each) do
        @user = create(:activated_user)
        put :attempt_login, email: @user.email, password: @user.password
      end
      it 'logs in activated user' do
        expect(session[:user_id]).to eq(@user.id)
      end
      it 'sets session data on successful login' do
        expect(session[:user_id]).to eq(@user.id)
        expect(session[:email]).to eq(@user.email)
      end
      it { should redirect_to(action: 'main') }
    end

    context 'when unactivated with valid attributes' do
      before(:each) do
        user =  create(:user)
        put :attempt_login, email: user.email, password: user.password
      end
      it 'does not log in user who is unactivated' do
        expect(session[:user_id]).to be_nil
      end
      it { should redirect_to(action: 'login') }
    end

    context 'with invalid attributes' do
      before { post :attempt_login, email: nil, password: nil }
      it { should redirect_to(action: :login) }
      it { should set_flash }
    end
  end

  describe 'before action' do
    it { should use_before_filter(:confirm_logged_in) }
    it do
      get :main
      should redirect_to users_login_path
    end
  end
end
