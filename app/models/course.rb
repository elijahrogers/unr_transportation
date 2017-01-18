class Course < ActiveRecord::Base
  belongs_to :user
  belongs_to :building
  delegate :name, to: :building, prefix: true

  validates :name, presence: true,
                   length: { within: 5...50 }
end
