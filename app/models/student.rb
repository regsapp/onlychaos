class Student < User
  include Stats

  has_paper_trail :on => [:update], :only => [:grades, :percentages, :total_answers, :correct_answers]

  has_many :tests, :foreign_key => "user_id"
  has_many :test_questions, through: :tests
  has_many :recent_tests, -> { recent }, :class_name => "Test", :foreign_key => "user_id"
  has_many :recent_test_questions, :class_name => "TestQuestion", through: :recent_tests, source: :test_questions
  belongs_to :school

  # temporarily (while we don't have exam boards per school)
  belongs_to :exam_board

  after_create :update_rank

  after_update :update_rank


  # # one day (when we have exam boards per school)
  # validates :school_id, presence: true
  # def exam_board
  #   school.exam_board
  # end

  #validates :birthday, presence: true

  def test_question_ids
    test_questions.ids
  end

  def answers
    recent_test_questions.map{ |tq| tq.answers.to_a }.flatten
  end

  def update_rank
    update = Boards::UpdateService.new
    update.execute(self)
  end

  def self.update_leaderboard
    update = Boards::UpdateService.new
    transaction do
      all.each do |student|
        if !student.tests.empty? && student.tests.last.updated_at > Date.today - 14
          update.execute(student)
        else
          Boards.students_leaderboard.remove_member(student.first_name.to_s)
        end
      end
    end
  end

  def self.update_grades
    transaction do
      all.each do |student|
        student.update(:grades => student.grade)
      end
    end
  end

  def self.update_percentages
    transaction do
      all.each do |student|
        student.update(:percentages => student.percentage)
      end
    end
  end

  def self.update_total_answers
    transaction do
      all.each do |student|
        student.update(:total_answers => student.total_answers_count)
      end
    end
  end

  def self.update_correct_answers
    transaction do
      all.each do |student|
        student.update(:correct_answers => student.correct_answers_count)
      end
    end
  end

  def self.weekly_update
    transaction do
      all.each do |student|
        MessageMailer.weekly_mail(student).deliver_now
      end
    end
  end

  # def self.took_recent_test
  #   past_fortnight = []
  #   # not_past_fortnight = []
  #   all.each do |student|
  #     # if !student.tests.empty?
  #       if !student.tests.empty? && student.tests.last.updated_at > Date.today - 14
  #         past_fortnight << student
  #       # else
  #         # not_past_fortnight << student
  #       end
  #     # else
  #       # not_past_fortnight << student
  #     # end
  #   end
  #   past_fortnight
  #   # not_past_fortnight
  # end

end
