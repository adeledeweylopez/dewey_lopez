class Comment < ActiveRecord::Base
  belongs_to :page
  validates :page_id, presence: true
  validates :content, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-]+(\.[\w+\-]+)*@([a-z\d\-]+\.)+[a-z]+\z/i
  validates :email, 
  			format: { with: VALID_EMAIL_REGEX }, 
  			allow_blank: true
end
