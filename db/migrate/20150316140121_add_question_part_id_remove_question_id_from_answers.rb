class AddQuestionPartIdRemoveQuestionIdFromAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :question_part, index: true
    add_foreign_key :answers, :question_parts
    remove_reference :answers, :question
    remove_foreign_key :answers, :questions
  end
end
