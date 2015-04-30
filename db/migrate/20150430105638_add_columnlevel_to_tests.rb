class AddColumnlevelToTests < ActiveRecord::Migration
  def change
    add_column :tests, :level, :integer, default: 1
  end
end
