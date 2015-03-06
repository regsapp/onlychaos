class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description
      t.integer :marks, default: 1
      t.string :answer_type

      t.timestamps null: false
    end
  end
end
