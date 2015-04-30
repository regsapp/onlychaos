class AddColumnsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :type, :string
    add_column :schools, :status, :string
    add_column :schools, :open_date, :date
    add_column :schools, :postcode, :string
    add_column :schools, :email, :string
  end
end
