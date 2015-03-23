class RemoveNumberFromTestQuestionParts < ActiveRecord::Migration
  def change
    remove_column :question_parts, :number
  end
end
