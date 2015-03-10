class Category < ActiveRecord::Base
  has_many :questions
  has_and_belongs_to_many :tests
  
  validates :name, presence: true, uniqueness: true
end
