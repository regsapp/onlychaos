class ExamBoard < ActiveRecord::Base
  has_many :schools

  validates :name, presence: true, uniqueness: true

  default_scope { order(:name) }
end
