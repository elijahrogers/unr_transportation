require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe 'GET #main' do
    it 'sets pass to empty string' do
      get(:main)
      expect(assigns['pass']).to eq('')
    end
  end

  describe 'POST #update' do
    it 'sets parameters correctly' do
      post(:update, pass: 'Blue', number: '', time: '09:52')
      expect(assigns['pass']).to eq('Blue')
    end
  end
end
