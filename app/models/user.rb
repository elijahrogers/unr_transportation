class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true,
                         length: { maximum: 50 }
  validates :last_name, presence: true,
                        length: { maximum: 100 }
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\z/ }
  validates :password, presence: true,
                       length: { within: 4...30 }

end
