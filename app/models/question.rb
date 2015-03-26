class Question < ActiveRecord::Base
  has_many :question_parts, dependent: :destroy
  belongs_to :category
  # belongs_to :year_group
  has_and_belongs_to_many :tests
  has_many :test_questions, dependent: :destroy
  has_many :tests, through: :test_questions
  has_and_belongs_to_many :exam_boards

  accepts_nested_attributes_for :question_parts, allow_destroy: true

  validates :category_id, presence: true

  validate :must_have_exam_boards unless Proc.new { |question| question.tutorial? }

  before_save :set_marks

  def self.tutorial
    Category.tutorial.questions
  end

  def self.selection_for(test)
    questions = where(category_id: test.category_ids).select(:id, :category_id, :marks).shuffle
    
    questions_by_category = {}
    questions.each do |question|
      questions_by_category[question.category] ||= []
      questions_by_category[question.category] << question
    end

    selection = []

    while selection.map(&:marks).sum < test.max_marks do
      picked_category = test.pick_category
      selected = questions_by_category[picked_category].pop
      selection << selected if selected
      break if questions_by_category.values.flatten.none?
    end
    selection.pop if selection.map(&:marks).sum > test.max_marks

    selection
  end

  def to_s
    description.to_s.html_safe
  end

  def category_name
    category.name
  end

  def exam_board_names
    exam_boards.map(&:name).join(", ")
  end

  def tutorial?
    category.tutorial?
  end

  private

  def must_have_exam_boards
    errors.add(:exam_boards, 'must have at least one selected') unless exam_boards.any?
  end

  def set_marks
    self.marks = question_parts.map(&:marks).sum
  end
end
