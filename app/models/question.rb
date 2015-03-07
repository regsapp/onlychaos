class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_one  :correct_answer, -> { where(reference: true) }, class_name: "Answer", dependent: :destroy

  accepts_nested_attributes_for :correct_answer

  validates :description, presence: true
  validates :marks, presence: true, numericality: { gt: 0 }
  validates :answer_type, presence: true, :inclusion => { :in => Answer::TYPES }

  def to_s
    description.to_s.html_safe
  end
end
