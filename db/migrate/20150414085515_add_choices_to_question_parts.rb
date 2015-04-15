class AddChoicesToQuestionParts < ActiveRecord::Migration
  def change
    add_column :question_parts, :choice_a, :text
    add_column :question_parts, :choice_b, :text
    add_column :question_parts, :choice_c, :text
    add_column :question_parts, :choice_d, :text
  end
end
