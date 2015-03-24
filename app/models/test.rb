class Test < ActiveRecord::Base
  include Stats

  belongs_to :year_group
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :test_questions, dependent: :destroy
  has_many :questions, through: :test_questions
  has_many :answers

  accepts_nested_attributes_for :test_questions

  validates :year_group_id, presence: true
  validates :duration, :inclusion => { :in => 1..60 }
  
  validate :must_have_questions, on: :create

  after_create :create_test_questions

  RECENT_LIMIT = 10

  scope :recent, -> { order(created_at: :desc).limit(RECENT_LIMIT) }

  def category_names
    categories.map(&:name).join(", ")
  end

  def max_marks
    duration.to_i
  end

  def next_test_question
    test_questions.find{ |test_question| !test_question.answered? }
  end

  def questions_count
    questions.count
  end

  def question_number(question)
    index = questions.index(question)
    index + 1 if index
  end

  private

  def question_selection
    @question_selection ||= Question.selection_for(self)
  end

  def must_have_questions
    errors.add(:categories, 'must have questions') unless question_selection.any?
  end

  def create_test_questions
    question_selection.each_with_index do |question, index|
      self.test_questions.create!(question_id: question.id, number: index + 1)
    end
  end
end
