class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.references :year_group, index: true
      t.integer :duration
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :tests, :year_groups
    add_foreign_key :tests, :users
  end
end
