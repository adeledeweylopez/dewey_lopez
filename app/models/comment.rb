class Comment < ActiveRecord::Base
  belongs_to :page
  validates :page_id, presence: true
  validates :content, presence: true
  validates :score,   presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-]+(\.[\w+\-]+)*@([a-z\d\-]+\.)+[a-z]+\z/i
  validates :email, 
  			format: { with: VALID_EMAIL_REGEX }, 
  			allow_blank: true

  def Comment.new_token
    SecureRandom.urlsafe_base64
  end

  def Comment.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_token
      self.token = Comment.digest(Comment.new_token)
    end
end
