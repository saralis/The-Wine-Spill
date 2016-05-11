class QuestionTag < ActiveRecord::Base
  validates_presence_of :question_id, :tag_id

  belongs_to :tag
  belongs_to :question
end
