module ApplicationHelper

  def logged_in?
    !!current_golfer
  end

  def authenticate_user
    redirect_to root_url, { notice: 'Please Log in or Sign Up'} if !logged_in?
  end

  def authenticate_owner(resource)
    redirect_to golfer_path(current_golfer) if resource.golfer != current_golfer
  end

end
