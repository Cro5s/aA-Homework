module ApplicationHelper
  def auth_token
    session_token = " <input type = 'hidden' name = 'authenticity_token' value = #{form_authenticity_token}/>"
    session_token.html_safe
  end
end
