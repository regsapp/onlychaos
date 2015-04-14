class Answer < ActiveRecord::Base
  belongs_to :question_part
  belongs_to :test
  #has_one :correct_answer, through: :question

  TYPES = ["integer", "text", "float", "formula", "multiple any", "multiple all", "multiple bool", "multiple choice"]

  before_save :mark!

  default_scope { where(reference: false) }

  def max_marks
    question_part.try(:marks)
  end

  def correct_answer
    question_part.try(:correct_answer)
  end

  def type
    question_part.answer_type
  end

  def category_name
    question_part.category_name
  end

  def mark!
    unless reference?
      self.marks = 0

      case type
      when "integer", "text", "float", "formula", "mutiple choice"
        set_max_marks! if to_type == correct_answer.to_type
      when "multiple any"
        set_max_marks! if correct_answer.to_type.any?{ |s| s.in? to_type }
      when "multiple all"
        set_max_marks! if correct_answer.to_type.all?{ |s| s.in? to_type }
      when "multiple bool"
        set_max_marks! if instance_eval(boolean_expression)
      end

      marks
    end
  end

  def correct?
    return nil if reference?
    marks == max_marks
  end

  def answered?
    return nil if reference?
    updated_at > created_at if persisted?
  end

  def tutorial?
    test.tutorial?
  end

  def to_type
    case type
    when "integer"
      content.to_i
    when "text", "formula", "multiple choice"
      content.to_s.squish
    when "float"
      content.to_f
    when "multiple any", "multiple all", "multiple bool"
      content.to_s.squish.split(/\W+/)
    end
  end

  private

    def boolean_expression
      correct_answer
      .content
      .gsub("(", " ( ")
      .gsub(")", " ) ")
      .split
      .map do |s|
        case s
        when "AND"
          "&&"
        when "OR"
          "||"
        when "(", ")"
          s
        else
          "content.to_s.include?('#{s}')"
        end
      end
      .join(" ")
    end

    def set_max_marks!
      self.marks = max_marks
    end
end
