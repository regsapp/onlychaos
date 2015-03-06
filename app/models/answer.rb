class Answer < ActiveRecord::Base
  belongs_to :question

  TYPES = ["integer", "text", "float", "formula", "multiple any", "multiple all"]

  before_save :mark!

  default_scope { where(reference: false) } 

  def max_marks
    question.try(:marks)
  end

  def correct_answer
    question.try(:correct_answer)
  end

  def type
    question.answer_type
  end

  def to_type
    case type
    when "integer"
      content.to_i
    when "text", "formula"
      content.squish
    when "float"
      content.to_f
    when "multiple any", "multiple all"
      content.squish.split(/\W+/)
    end
  end

  def mark!
    unless reference?
      self.marks = 0

      case type
      when "integer", "text", "float", "formula"
        self.marks = max_marks if to_type == correct_answer.to_type
      when "multiple any"
        self.marks = max_marks if correct_answer.to_type.any?{ |s| s.in? to_type }
      when "multiple all"
        self.marks = max_marks if correct_answer.to_type.all?{ |s| s.in? to_type }
      end

      marks
    end
  end
end
