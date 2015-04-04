class ExamBoard < ActiveRecord::Base
  has_many :schools
  has_and_belongs_to_many :questions
  has_many :categories

  validates :name, presence: true, uniqueness: true

  default_scope { order(:name) }
end
