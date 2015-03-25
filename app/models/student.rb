class Student < User
  include Stats 

  has_many :tests, :foreign_key => "user_id"
  has_many :test_questions, through: :tests
  has_many :recent_tests, -> { recent }, :class_name => "Test", :foreign_key => "user_id"
  has_many :recent_test_questions, :class_name => "TestQuestion", through: :recent_tests, source: :test_questions
  belongs_to :school

  validates :school_id, presence: true
  validates :birthday, presence: true

  def test_question_ids
    test_questions.ids
  end

  def answers
    recent_test_questions.map{ |tq| tq.answers.to_a }.flatten
  end
end