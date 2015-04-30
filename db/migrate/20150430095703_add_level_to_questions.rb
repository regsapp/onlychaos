class AddLevelToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :level, :integer, index: true
  end
end
