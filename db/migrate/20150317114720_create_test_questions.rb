class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
      t.references :test, index: true
      t.references :question, index: true
      t.integer :number
      t.integer :marks

      t.timestamps null: false
    end
    add_foreign_key :test_questions, :tests
    add_foreign_key :test_questions, :questions
  end
end
