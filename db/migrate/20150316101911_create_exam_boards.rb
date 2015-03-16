class CreateExamBoards < ActiveRecord::Migration
  def change
    create_table :exam_boards do |t|
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
