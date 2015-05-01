class AddUnitsToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :unit, index: true
    add_foreign_key :categories, :units
  end
end
