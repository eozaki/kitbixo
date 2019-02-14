module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end

  def bixos_index?
    params[:controller] == "bixos" and params[:action] == "index"
  end

  def confirmations_index?
    params[:controller] == "confirmations" and params[:action] == "index"
  end

  def modalidades_index?
    params[:controller] == "modalidades" and params[:action] == "index"
  end

end
