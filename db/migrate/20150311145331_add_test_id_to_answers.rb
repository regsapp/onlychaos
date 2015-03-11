class AddTestIdToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :test, index: true
    add_foreign_key :answers, :tests
  end
end
