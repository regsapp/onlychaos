class Test < ActiveRecord::Base
  belongs_to :year_group
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :questions

  validates :year_group_id, presence: true
  validates :duration, :inclusion => { :in => 1..60 }

  before_create :append_questions

  def category_names
    categories.map(&:name).join(", ")
  end

  def max_marks
    duration
  end

  private

  def append_questions
    self.questions = Question.selection_for(self)
  end
end
