class AddTutorialColumnToTest < ActiveRecord::Migration
  def change
    add_column :tests, :tutorial, :boolean, default: false
  end
end
