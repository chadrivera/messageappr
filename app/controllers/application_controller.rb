class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :set_time_zone
  def current_user
      User.find_by_id(session[:current_user_id])
  end


  #
  def set_time_zone(&block)
    Time.use_zone("Eastern Time (US & Canada)",&block)
  end
end
