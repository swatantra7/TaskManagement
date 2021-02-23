module ApplicationHelper

  def flash_messages
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, id: 'flash', class: "alert alert-#{bootstrap_class_for(msg_type)} alert-dismissible text-center", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def button_color(invoice)
    if invoice.save_and_send?
      "btn btn-success"
    else
      "btn-light"
    end
  end

end