class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_authentication
    redirect_to root_path, alert: "Please log in first." unless Current.user
  end

  def require_admin
    redirect_to root_path, alert: "Not authorized." unless Current.admin?
  end

  def submission_deadline
    Time.parse(ENV["SUBMISSION_DEADLINE"])
  end
  helper_method :submission_deadline

  def submissions_open?
    Time.current < submission_deadline
  end
  helper_method :submissions_open?
end
