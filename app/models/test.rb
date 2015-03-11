class Test < ActiveRecord::Base
  belongs_to :year_group
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :year_group_id, presence: true
  validates :duration, :inclusion => { :in => 1..60 }

  def category_names
    categories.map(&:name).join(", ")
  end
end
