class Course < ActiveRecord::Base
  belongs_to :user
  belongs_to :building

  validates :name, presence: true,
                   length: { within: 5...50 }
end
