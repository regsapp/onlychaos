class RemoveAnswerTypeFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :answer_type
  end
end
