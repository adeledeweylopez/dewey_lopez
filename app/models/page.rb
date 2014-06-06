class Page < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true
  validates :user_id, presence: true
  validates :title,   presence: true, uniqueness: true
end
