class Test < ActiveRecord::Base
  include Stats

  belongs_to :year_group
  belongs_to :student, :class_name => "Student", :foreign_key => "user_id"
  has_and_belongs_to_many :categories
  has_many :test_questions, dependent: :destroy
  has_many :questions, through: :test_questions
  has_many :answers

  accepts_nested_attributes_for :test_questions

  validates :duration, inclusion: { in: 1..100 , unless: :tutorial? }

  validate :must_have_categories
  validate :must_have_selected_questions


  # temporarily (while we don't have exam boards per school)
  # has_one :exam_board, through: :student
  # attr_writer :exam_board_id
  # validates :exam_board_id, presence: { unless: :tutorial? }
  # after_save :store_exam_board_id

  def exam_board_id
    @exam_board_id ||= student.exam_board_id
  end


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
    category_ranges.to_a.find{ |a| rand_number.in? a[1] }.to_a[0]
  end

  def self.question_marks
    questions = self.questions
    array_marks = []
    questions.each do |question|
      array_marks << question.marks
    end
    return array_marks.sum
  end

  private

  def must_have_categories
    errors.add(:categories, 'must have at least one selected') unless categories.any?
  end

  def must_have_selected_questions
    errors.add(:selection, 'must have at least one question') unless selected_questions.any?
  end

  def selected_questions
    return @selected_questions if @selected_questions
    @selected_questions = tutorial? ? Question.tutorial : Question.selection_for(self)
  end

  def create_test_questions
    selected_questions.each_with_index do |question, index|
      self.test_questions.create!(question_id: question.id, number: index + 1)
    end
  end

  def category_incorrect_percentages
    percentages = {}
    categories.each do |category|
      percentages[category] = student.incorrect_percentage(category.name)
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

  def store_exam_board_id
    student.exam_board_id = exam_board_id
    student.save!
  end
end
