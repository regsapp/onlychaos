class Test < ActiveRecord::Base
  include Stats

  belongs_to :year_group
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :test_questions, dependent: :destroy
  has_many :questions, through: :test_questions
  has_many :answers

  accepts_nested_attributes_for :test_questions

  # validates :year_group_id, presence: true
  validates :duration, :inclusion => { :in => 1..100 }

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

  def category_probabilities
    probabilities = {}
    total = category_incorrect_percentages.values.sum
    categories.each do |category|
      probabilities[category] = category_incorrect_percentages[category].to_f / total
    end
    probabilities
  end

  def pick_category
    rand_number = rand
    category_ranges.to_a.find{ |a| rand_number.in? a[1] }[0]
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

  def category_incorrect_percentages
    percentages = {}
    categories.each do |category|
      percentages[category] = user.incorrect_percentage(category.name)
    end
    percentages
  end

  def category_ranges
    ranges = {}
    from = 0.0
    categories.each do |category|
      to = from + category_probabilities[category]
      ranges[category] = from..to
      from = to
    end
    ranges
  end
end
