class AddGradesToUser < ActiveRecord::Migration
  def change
    add_column :users, :grades, :string
    add_column :users, :percentages, :float
    add_column :users, :total_answers, :integer
    add_column :users, :correct_answers, :integer
  end
end
