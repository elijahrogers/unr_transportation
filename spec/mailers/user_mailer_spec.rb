require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'account_activation' do
    let(:user) { User.new(first_name: 'Johnny', last_name: 'Appleseed', email: 'jappleseed@example.com', password: 'password', activation_token: User.new_token) }
    let(:mail) { UserMailer.account_activation(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Account activation')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['noreply@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
      expect(mail.body.encoded).to match(user.first_name)
      expect(mail.body.encoded).to match(user.activation_token)
    end
  end

  describe 'password_reset' do
    let(:user) { User.new(first_name: 'Johnny', last_name: 'Appleseed', email: 'jappleseed@example.com', password: 'password', reset_token: User.new_token) }
    let(:mail) { UserMailer.password_reset(user) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Password reset')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['noreply@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(user.reset_token)
    end
  end
end
