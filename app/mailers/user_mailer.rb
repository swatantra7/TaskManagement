class UserMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  def send_notification_mail(tasks, user, subject)
    @task_count = tasks.count
    unless Rails.env.production?
      to = "swatantrajha712@gmail.com"
    end
    mail(
      :to => user.email,
      :cc => ['chaithanya@theinnerhour.com', 'swatantrajha712@gmail.com'],
      :subject => subject
    )
  end

end