class Category < ActiveRecord::Base
  has_many :questions
  has_many :test_questions, through: :questions
  has_and_belongs_to_many :tests

  has_and_belongs_to_many :exam_boards

  validates :name, presence: true, uniqueness: true
  validates :year, presence: { unless: :tutorial? }

  scope :real, -> { where(tutorial: false) }

  def self.tutorial
    find_by(tutorial: true)
  end

  def test_question_ids
    test_questions.ids
  end
end
