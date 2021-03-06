class User < ApplicationRecord
  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :username, :session_token, uniqueness: true

  after_initialize :ensure_session_token

  has_many :goals

  has_many :comments,
    foreign_key: :author_id,
    class_name: :UserComment

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    # debugger
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end

  def reset_session_token!
    self.session_token = User.generate_token
    self.save
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= User.generate_token
  end

end
