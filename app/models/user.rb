class User < ActiveRecord::Base
  enum role: [:member, :admin]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  before_save { self.email = email.downcase if email.present? }
  #before_validation { self.role ||= :member}

  before_create :generate_auth_token

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password_digest, presence: true, length: { minimum: 6 }, unless: :password_digest
  validates :password_digest, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  validates :role, presence: true,
            inclusion: { in: roles.keys }

  has_secure_password

  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def generate_auth_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless User.find_by(auth_token: auth_token)
    end
  end
end
