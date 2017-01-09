require 'rails_helper'

RSpec.describe PasswordResetsController, type: :controller do

  describe 'POST #create' do
    context 'for user with account' do
      before do
        @user = create(:activated_user)
        post :create, {password_reset: {email: @user.email}, commit: 'Submit'}
        @user.reload
      end
      it 'finds user with account' do
        expect(assigns[:user]).to eq(@user)
      end
      it 'creates password reset token' do
        expect(@user.reset_digest).not_to be_nil
      end
      it 'sends email for reset password' do
        expect(ActionMailer::Base.deliveries.last.subject.downcase).to match('password reset')
        expect(ActionMailer::Base.deliveries.last.to).to include(@user.email)
      end
      it { should redirect_to(root_url) }
    end
    context 'for user without account' do
      before do
        post :create, {password_reset: {email: 'user@without.account'}, commit: 'Submit'}
      end
      it { should set_flash.now }
      it { should render_template('new') }
    end
  end

  describe 'Get #edit' do
    context 'with valid reset token' do
      it do
        @user = create(:activated_user)
        @user.create_reset_digest
        get :edit, id: @user.reset_token, email: @user.email
        should render_template('edit')
      end
    end
    context 'with expired reset token' do
      before do
        @user = create(:activated_user)
        @user.create_reset_digest
        @user.reset_sent_at = 3.hours.ago
        @user.save
        get :edit, id: @user.reset_token, email: @user.email
      end
      it { should set_flash }
      it { should redirect_to new_password_reset_url }
    end
    context 'for unactivated user' do
      it do
        user = create(:user)
        user.create_reset_digest
        get :edit, id: user.reset_token, email: user.email
        should redirect_to root_url
      end
    end
  end

  describe 'PUT #update' do
    context 'with invalid password' do
      before do
        @user = create(:activated_user)
        @user.create_reset_digest
        put :update, email: @user.email, user: { password: 'abc', password_confirmation: 'abc' }, id: @user.reset_token
      end
      it { should render_template('edit') }
    end
    context 'with no password' do
      before do
        @user = create(:activated_user)
        @user.create_reset_digest
        put :update, email: @user.email, user: { password: '', password_confirmation: '' }, id: @user.reset_token
      end
      it { should render_template('edit') }
    end
    context 'with valid password' do
      before do
        @user = create(:activated_user)
        @user.create_reset_digest
        put :update, email: @user.email, user: { password: 'new_password', password_confirmation: 'new_password' }, id: @user.reset_token
      end
      it 'updates password' do
        expect(@user.reload.authenticated?(:password, 'new_password')).to eq(true)
      end
      it { should redirect_to users_login_path }
    end
  end

  describe 'before actions' do
    it { should use_before_action(:find_user) }
    it { should use_before_action(:valid_user) }
    it { should use_before_action(:check_expiration) }
  end
end
