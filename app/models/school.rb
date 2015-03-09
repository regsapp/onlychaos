class School < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :students
  has_many :teachers

  default_scope { order(:name) }
end
