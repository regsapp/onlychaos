class CreateQuestionParts < ActiveRecord::Migration
  def change
    create_table :question_parts do |t|
      t.integer :number
      t.text :description
      t.integer :marks, default: 1
      t.string :answer_type
      t.references :question, index: true

      t.timestamps null: false
    end
    add_foreign_key :question_parts, :questions
  end
end