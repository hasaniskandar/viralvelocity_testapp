module ApplicationHelper
  def flash_messages
    flash.map do |type, message|
      alert_class = case type
      when :notice then :info
      when :alert, :warning then :error
      else type
      end
      content_tag :div, :class => "alert alert-#{alert_class} fade in" do
        content_tag(:button, raw("&times;").html_safe, :class => "close", :"data-dismiss" => "alert") + h(message)
      end
    end.join("\n").html_safe
  end
end
