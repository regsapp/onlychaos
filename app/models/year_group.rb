class YearGroup < ActiveRecord::Base
  has_many :questions
  
  validates :name, presence: true, uniqueness: true
end
