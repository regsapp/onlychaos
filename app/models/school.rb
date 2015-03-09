class School < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :users

  default_scope { order(:name) }
end
