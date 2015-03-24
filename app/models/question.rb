class Question < ActiveRecord::Base
  has_many :question_parts, dependent: :destroy
  belongs_to :category
  belongs_to :year_group
  has_and_belongs_to_many :tests
  has_many :test_questions, dependent: :destroy
  has_many :tests, through: :test_questions
  has_and_belongs_to_many :exam_boards

  accepts_nested_attributes_for :question_parts

  validates :category_id, presence: true
  validates :year_group_id, presence: true

  validate :must_have_exam_boards

  before_save :set_marks

  def self.selection_for(test)
    selection = where(year_group_id: test.year_group_id, category_id: test.category_ids).shuffle

    while selection.map(&:marks).sum > test.max_marks do
      selection.pop
    end

    selection
  end

  def self.ids_asked_to_user(user, category=nil, recently=false)
    test_questions = TestQuestion.asked_to_user(user, category, recently)
    test_questions.map(&:question_id).uniq
  end

  def self.asked_to_user(user, category=nil, recently=false)
    where(id: ids_asked_to_user(user, category, recently))
  end

  def self.never_asked_to_user(user, category=nil, recently=false)
    never_asked = where.not(id: ids_asked_to_user(user, category, recently))
    never_asked = never_asked.where(category_id: category.id) if category
    never_asked
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

  private

  def must_have_exam_boards
    errors.add(:exam_boards, 'must have at least one selected') if exam_boards.none?
  end

  def set_marks
    self.marks = question_parts.map(&:marks).sum
  end
end
