class Answer < ActiveRecord::Base
  belongs_to :question

  validates :question_id, presence: true

  def max_marks
    question.try(:marks)
  end

  def correct_answer
    question.try(:correct_answer)
  end
end
