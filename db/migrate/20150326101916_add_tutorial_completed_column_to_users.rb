class AddTutorialCompletedColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tutorial_completed, :boolean, default: false
  end
end
