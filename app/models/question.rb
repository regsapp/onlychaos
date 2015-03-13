class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_one  :correct_answer, -> { where(reference: true) }, class_name: "Answer", dependent: :destroy
  belongs_to :category
  belongs_to :year_group
  has_and_belongs_to_many :tests

  accepts_nested_attributes_for :correct_answer

  validates :description, presence: true
  validates :marks, presence: true, numericality: { gt: 0 }
  validates :answer_type, presence: true, :inclusion => { :in => Answer::TYPES }
  validates :category_id, presence: true
  validates :year_group_id, presence: true

  def self.selection_for(test)
    selection = where(year_group_id: test.year_group_id, category_id: test.category_ids).shuffle

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
end
