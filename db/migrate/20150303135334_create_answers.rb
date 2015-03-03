class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.text :description
      t.integer :marks

      t.timestamps null: false
    end
    add_foreign_key :answers, :questions
  end
end
