class AddExamBoardIdToSchools < ActiveRecord::Migration
  def change
    add_reference :schools, :exam_board, index: true
    add_foreign_key :schools, :exam_boards
  end
end
