class Message < ActiveRecord::Base
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :body, presence: true

  default_scope { order(created_at: :desc) }

  after_create :send_notification

  private

  def send_notification
    MessageMailer.new_message(self).deliver
  end
end
