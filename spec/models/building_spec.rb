require 'rails_helper'

RSpec.describe Building, type: :model do
  it { should have_many(:courses)}
end
