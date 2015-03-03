class Question < ActiveRecord::Base
  has_many :answers

  ANSWER_TYPES = ["Text", "Float", "Integer", "Math Formula"]

  validates :description, presence: true
  validates :answer_type, presence: true, inclusion: ANSWER_TYPES
  validates :marks, presence: true, numericality: { gt: 0 }
  validates :correct_answer, presence: true

  def to_s
    description.to_s.html_safe
  end
end
