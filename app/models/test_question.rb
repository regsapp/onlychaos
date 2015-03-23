class TestQuestion < ActiveRecord::Base
  belongs_to :test
  belongs_to :question
  has_many :question_parts, through: :question
  has_many :answers, ->(test_question) { where(test_id: test_question.test.id) }, through: :question_parts

  after_create :create_answers

  accepts_nested_attributes_for :answers

  def answered?
    answers.all?{ |answer| answer.answered? }
  end

  def correct?
    answers.all?{ |answer| answer.correct? }
  end

  def next_test_question
    if !correct? && next_chance?
      self
    else
      test.next_test_question
    end
  end

  def last?
    next_test_question.nil?
  end

  def next_chance?
    attempts < 2
  end

  private

  def create_answers
    question_parts.each do |question_part|
      question_part.answers.create!(test_id: test.id)
    end
  end
end
