class School < ActiveRecord::Base
  require 'csv'

  has_many :users
  has_many :students
  has_many :teachers
  belongs_to :exam_board

  # validates :name, presence: true, uniqueness: true
  # validates :exam_board_id, presence: true

  default_scope { order(:name) }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      school_hash = row.to_hash
      school = School.where(id: school_hash["id"])

      if school.count == 1
        school.first.update_attributes(school_hash)
      else
        school.create!(school_hash)
      end
    end
  end

end
