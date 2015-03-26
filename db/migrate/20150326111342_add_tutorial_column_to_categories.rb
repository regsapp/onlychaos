class AddTutorialColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :tutorial, :boolean, default: false
  end
end
