class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user, presence: true, uniqueness: true
  has_many :votes, as: :votable

  validates :body, presence: true
end
