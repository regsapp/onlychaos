class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  TYPES = ['Admin', 'Student', 'Teacher']

  def admin?
    type == 'Admin'
  end

  def student?
    type == 'Student'
  end

  def teacher?
    type == 'Teacher'
  end
end
