class AddYearToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :year, :text
  end
end
