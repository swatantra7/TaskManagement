class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :works, class_name: 'Work'


  class << self

    # TODO - For Large Data, Need to push the task in Background Using #ApplicationJob and process using sidekiq server

    def send_daily_deadline_alert
      all.each do |user|
        tasks = user.works
        taks = tasks.not_done.deadline_tomorrow
        UserMailer.send_notification_mail(tasks, user, 'Daily Backlog Reminder').deliver_now!
      end
    end

    def send_hourly_deadline_alert
      all.each do |user|
        tasks = user.works
        taks = tasks.not_done.deadline_in_an_hour
        UserMailer.send_notification_mail(tasks, user, 'Hourly BackLog Reminder').deliver_now!
      end
    end

  end

end
