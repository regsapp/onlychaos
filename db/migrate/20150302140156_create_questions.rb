class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description
      t.string :answer_type
      t.integer :marks
      t.text :correct_answer

      t.timestamps null: false
    end
  end
end
