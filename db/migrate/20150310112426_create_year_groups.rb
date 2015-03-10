class CreateYearGroups < ActiveRecord::Migration
  def change
    create_table :year_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
