class Tag < ActiveRecord::Base
  validates_presence_of :name

  has_many :question_tags
  has_many :questions, through: :question_tags
end
