class TestQuestion < ActiveRecord::Base
  belongs_to :test
  belongs_to :question
  has_many :question_parts, through: :question
  has_many :answers, ->(test_question) { where(test_id: test_question.test.id) }, through: :question_parts

  after_create :create_answers

  accepts_nested_attributes_for :answers

  RECENT_LIMIT = 10

  scope :recent, -> { order(created_at: :desc).limit(RECENT_LIMIT) }

  def user
    test.user
  end

  def answered?
    answers.all?{ |answer| answer.answered? }
  end

  def correct?
    answers.all?{ |answer| answer.correct? }
  end

  def next_test_question
    return self if !correct? && next_chance?
    return self if !correct? && tutorial?
    test.next_test_question
  end

  def last?
    next_test_question.nil?
  end

  def next_chance?
    attempts < 2
  end

  def tutorial?
    test.tutorial?
  end

  private

  def create_answers
    question_parts.each do |question_part|
      question_part.answers.create!(test_id: test.id)
    end
  end
end
