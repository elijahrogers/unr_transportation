class Course < ActiveRecord::Base
  belongs_to :user
  has_one :building

  validates :name, presence: true,
                   length: { within: 5...50 }
end
