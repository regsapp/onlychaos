class DropJoinTableQuestionTest < ActiveRecord::Migration
  def change
    drop_join_table :questions, :tests
  end
end
