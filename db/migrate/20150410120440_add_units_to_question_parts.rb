class AddUnitsToQuestionParts < ActiveRecord::Migration
  def change
    add_column :question_parts, :units, :text
  end
end
