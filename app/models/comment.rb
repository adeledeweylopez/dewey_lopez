class Comment < ActiveRecord::Base
	belongs_to :page
	has_many :replies, foreign_key: "child_id" 
	has_many :children, through: :replies, source: :child
	validates :page_id, presence: true
	validates :content, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-]+(\.[\w+\-]+)*@([a-z\d\-]+\.)+[a-z]+\z/i
	validates :email, 	format: { with: VALID_EMAIL_REGEX }, allow_blank: true


	def replies_to?(other_comment)
		replies.find_by(parent_id: other_comment.id)
	end

	def reply!(other_comment)
		replies.create!(parent_id: other_comment.id)
	end
end
