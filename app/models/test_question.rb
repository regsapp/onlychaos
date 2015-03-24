class TestQuestion < ActiveRecord::Base
  belongs_to :test
  belongs_to :question
  has_many :question_parts, through: :question
  has_many :answers, ->(test_question) { where(test_id: test_question.test.id) }, through: :question_parts

  after_create :create_answers

  accepts_nested_attributes_for :answers

  def self.latests_asked_to_user(user, category=nil, limit=10)
    ids = user.test_question_ids
    ids |= category.test_question_ids if category

    latests = where(id: ids).order(created_at: :desc)
    latests = latests.limit(limit) if limit
    latests
  end

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
