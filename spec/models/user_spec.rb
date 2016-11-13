require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a first name' do
    user.first_name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid witout a last name' do
    user.last_name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with first_name over 50 characters' do
    user.first_name = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
    expect(user).to_not be_valid
  end

  it 'is not valid with last_name over 100 characters' do
    user.last_name = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
    expect(user).to_not be_valid
  end

  it 'is not valid with password shorter than 4 characters' do
    user.password = 'abc'
    expect(user).to_not be_valid
  end

  it 'is not valid with password longer than 30 characters' do
    user.password = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
    expect(user).to_not be_valid
  end

  it { should have_many(:courses) }

  it { should have_secure_password }

  it { should validate_presence_of(:password) }

  it { should validate_uniqueness_of(:email)}
end
