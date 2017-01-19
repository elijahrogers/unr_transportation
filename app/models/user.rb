class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token
  before_create :create_activation_digest
  after_create :send_activation_email
  has_secure_password
  has_many :courses
  validates :first_name, presence: true,
                         length: { maximum: 50 }
  validates :last_name, presence: true,
                        length: { maximum: 100 }
  validates :email, presence: true,
                    uniqueness: true
  validates :password, presence: true,
                       length: { within: 4...30 },
                       allow_nil: true
  validates :courses, length: { maximum: 6 }

  def self.digest(string)
    BCrypt::Password.create(string)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def create_password_reset
    return unless activated?
    create_reset_digest
    send_password_reset_email
  end

  private

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
