module ApplicationHelper

  def logged_in?
    !!current_golfer
  end

end
