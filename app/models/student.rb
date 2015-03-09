class Student < User
  belongs_to :school

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :school_id, presence: true
  validates :birthday, presence: true
end