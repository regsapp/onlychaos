class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, index: true

      t.timestamps null: false
    end
  end
end
