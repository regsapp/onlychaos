class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_one  :correct_answer, -> { where(reference: true) }, class_name: "Answer", dependent: :destroy
  belongs_to :category
  # belongs_to :year_group
  has_and_belongs_to_many :tests
  has_and_belongs_to_many :exam_boards

  accepts_nested_attributes_for :correct_answer

  validates :description, presence: true
  validates :marks, presence: true, numericality: { gt: 0 }
  validates :answer_type, presence: true, :inclusion => { :in => Answer::TYPES }
  validates :category_id, presence: true
  # validates :year_group_id, presence: true

  validate :must_have_exam_boards

  def self.selection_for(test)
    selection = where(category_id: test.category_ids).shuffle

    while selection.map(&:marks).sum > test.max_marks do
      selection.pop
    end

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

  private

  def must_have_exam_boards
    errors.add(:exam_boards, 'must have at least one selected') if exam_boards.none?
  end
end
