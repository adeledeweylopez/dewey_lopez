class User < ActiveRecord::Base
  has_many :pages
  has_many :moods
  before_save { email.downcase! }
  before_create :create_remember_token
  validates :name, 	presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-]+(\.[\w+\-]+)*@([a-z\d\-]+\.)+[a-z]+\z/i

  validates :email, 	presence: true,
    		format: { with: VALID_EMAIL_REGEX },
    		uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates_uniqueness_of :user_alias


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
  	# Sequence posts are for the user to organize their other posts.
    Page.where("user_id = ? AND sequence = ?", id, false)
  end

  def self.find(input)
  	# Find users by their id, or their alias.
    input.to_i == 0 ? find_by(:user_alias => input) : super
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
