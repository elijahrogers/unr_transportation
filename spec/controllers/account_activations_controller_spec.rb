require 'rails_helper'

RSpec.describe AccountActivationsController, type: :controller do
  describe 'GET #edit' do
    context 'with valid token' do
      before(:each) do
        @user = User.create({first_name: 'Johnny', last_name: 'Appleseed', email: 'jappleseed@example.com', password: 'password', activated: false})
        get :edit, {id: @user.activation_token, email: @user.email}
        @user.reload
      end
      it 'activates user' do
        expect(@user.activated).to be true
      end
      it { should redirect_to(users_login_path)}
    end

    context 'with invalid token' do
      before(:each) do
        @user = User.create({first_name: 'Johnny', last_name: 'Appleseed', email: 'jappleseed@example.com', password: 'password', activated: false})
        get :edit, {id: 'abc123', email: @user.email}
        @user.reload
      end
      it 'does not activate user' do
        expect(@user.activated).to be false
      end
      it { should redirect_to(root_url) }
    end
  end
end
