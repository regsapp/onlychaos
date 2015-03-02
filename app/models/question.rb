class Question < ActiveRecord::Base
  ANSWER_TYPES = ["Text", "Float", "Integer", "Math Formula"]

  validates :description, presence: true
  validates :answer_type, presence: true, inclusion: ANSWER_TYPES
  validates :marks, presence: true, numericality: { gt: 0 }
  validates :correct_answer, presence: true
end
