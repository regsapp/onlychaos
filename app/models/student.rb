class Student < User
  include Stats

  has_many :tests, :foreign_key => "user_id"
  has_many :test_questions, through: :tests
  belongs_to :school

  validates :school_id, presence: true
  validates :birthday, presence: true

  def test_question_ids
    test_questions.ids
  end

  def answers
    test_questions.map{ |tq| tq.answers.to_a }.flatten
  end

  # def stats(test_limit=10)
  #   Test.stats(self, test_limit)
  # end
end