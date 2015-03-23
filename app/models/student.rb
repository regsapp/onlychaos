class Student < User
  belongs_to :school

  validates :school_id, presence: true
  validates :birthday, presence: true
end