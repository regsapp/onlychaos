class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
