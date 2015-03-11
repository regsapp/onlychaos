class Test < ActiveRecord::Base
  belongs_to :year_group
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :questions
  has_many :answers

  validates :year_group_id, presence: true
  validates :duration, :inclusion => { :in => 1..60 }
  
  validate :must_have_questions, on: :create

  before_create :append_questions

  def category_names
    categories.map(&:name).join(", ")
  end

  def max_marks
    duration.to_i
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

  def append_questions
    self.questions = @question_selection
  end
end
