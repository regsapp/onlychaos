class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, index: true, default: "Student"
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_reference :users, :school, index: true
    add_foreign_key :users, :schools
  end
end
