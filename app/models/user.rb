class User < ActiveRecord::Base
  has_secure_password
  has_many :courses
  validates :first_name, presence: true,
                         length: { maximum: 50 }
  validates :last_name, presence: true,
                        length: { maximum: 100 }
  validates :email, presence: true,
                    uniqueness: true
  validates :password, presence: true,
                       length: { within: 4...30 }
  validates :courses, length: { maximum: 6 }

end
