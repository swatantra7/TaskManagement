class Work < ApplicationRecord

  validates :user_id, :status_id, :name, :deadline, presence: true

  belongs_to :user
  belongs_to :status

  delegate :email, to: :user, allow_nil: true, prefix: true
  delegate :name, to: :status, allow_nil: true, prefix: true

  scope :not_done, -> {where.not(status_id: Status.find_by(name: 'Done').id)}
  scope :deadline_in_an_hour, -> {where(deadline: Time.current..(Time.current+1.hour))}
  scope :deadline_tomorrow, -> {where(deadline:  Time.current+24.hours..Time.current+25.hours)}


end
