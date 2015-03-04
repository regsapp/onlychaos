class Answer < ActiveRecord::Base
  belongs_to :question

  validates :question_id, presence: true

  before_save :mark

  def max_marks
    question.try(:marks)
  end

  def correct_answer
    question.try(:correct_answer)
  end

  private

    def mark
      self.marks = question.mark(description)
    end
end
