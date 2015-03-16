class School < ActiveRecord::Base
  has_many :students
  has_many :teachers
  belongs_to :exam_board

  validates :name, presence: true, uniqueness: true
  validates :exam_board_id, presence: true

  default_scope { order(:name) }
end
