class AddExamBoardIdToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :exam_board, index: true
    add_foreign_key :categories, :exam_boards
  end
end
