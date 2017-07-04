module StationsHelper
  def render_user_status(user)
    if user.is_admin?
      content_tag(:i, "", class: "fa fa-check-square-o")
    else
      content_tag(:i, "", class: "fa fa-square-o")
    end
  end

end
