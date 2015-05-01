class CreateJoinTableUnitTest < ActiveRecord::Migration
  def change
    create_join_table :units, :tests do |t|
    end
  end
end
