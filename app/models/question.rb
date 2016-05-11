class Question < ActiveRecord::Base
  validates_presence_of :title, :body, :view_count, :user_id

  belongs_to :user
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :votes, as: :voteable
  has_many :answers
  has_many :comments, as: :commentable
end
