class CreateJoinTableCategoryTest < ActiveRecord::Migration
  def change
    create_join_table :categories, :tests do |t|
      # t.index [:category_id, :test_id]
      # t.index [:test_id, :category_id]
    end
  end
end
