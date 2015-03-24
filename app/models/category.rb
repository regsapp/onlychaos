class Category < ActiveRecord::Base
  has_many :questions
  has_many :test_questions, through: :questions
  has_and_belongs_to_many :tests

  validates :name, presence: true, uniqueness: true
  validates :year, presence: true


  def test_question_ids
    test_questions.ids
  end

end
