class AddAttemptsToTestQuestions < ActiveRecord::Migration
  def change
    add_column :test_questions, :attempts, :integer, default: 0
  end
end
