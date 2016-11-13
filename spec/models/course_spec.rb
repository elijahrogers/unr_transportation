require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should belong_to(:building) }
  it { should belong_to(:user) }
end
