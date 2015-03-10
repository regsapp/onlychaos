class AddCategoryAndYearGroupReferencesToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :year_group, index: true
    add_foreign_key :questions, :year_groups
    add_reference :questions, :category, index: true
    add_foreign_key :questions, :categories
  end
end
