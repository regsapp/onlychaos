class CreateJoinTableExamBoardQuestion < ActiveRecord::Migration
  def change
    create_join_table :exam_boards, :questions do |t|
      # t.index [:exam_board_id, :question_id]
      # t.index [:question_id, :exam_board_id]
    end
  end
end
