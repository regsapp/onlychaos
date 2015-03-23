class Test < ActiveRecord::Base
  belongs_to :year_group
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :test_questions, dependent: :destroy
  has_many :questions, through: :test_questions
  has_many :answers

  accepts_nested_attributes_for :test_questions

  validates :year_group_id, presence: true
  validates :duration, :inclusion => { :in => 1..100 }
  
  validate :must_have_questions, on: :create

  after_create :create_test_questions

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

  def stats
    stats = {}
    answers.each do |answer|
      [:all, answer.category_name].each do |aggregation|
        stats[aggregation] ||= Hash.new(0)
        stats[aggregation][:correct_answers_count] += answer.correct? ? 1 : 0
        stats[aggregation][:questions_count] += 1
        stats[aggregation][:marks] += answer.marks
        stats[aggregation][:max_marks] += answer.max_marks
      end
    end
    stats
  end

  def correct_answers_count(aggregation=:all)
    stats[aggregation][:correct_answers_count]
  end

  def incorrect_answers_count(aggregation=:all)
    stats[aggregation][:questions_count] - stats[aggregation][:correct_answers_count]
  end

  def percentage(aggregation=:all)
    stats[aggregation][:correct_answers_count].to_f / stats[aggregation][:questions_count] * 100
  end

  def grade
    #TO DO
    "TBD"
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
