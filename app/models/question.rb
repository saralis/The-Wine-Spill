class Question < ActiveRecord::Base
  validates_presence_of :title, :body, :view_count, :user_id

  belongs_to :user
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :votes, as: :votable
  has_many :answers
  has_many :comments, as: :commentable

  def vote_count
    self.votes.reduce(0){|sum, vote| sum + vote.count}
  end

  def self.sort_by_view
    Question.all.sort_by do |question|
      -question.view_count
    end
  end


  def self.sort_by_votes
    Question.all.sort_by do |question|
      -question.vote_count
    end
  end

  def self.most_recent
    Question.all.sort_by do |question|
      question.created_at
    end.reverse
  end

end
