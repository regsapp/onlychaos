class AddExamBoardColumnToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :exam_board, index: true
    add_foreign_key :users, :exam_boards
  end
end
