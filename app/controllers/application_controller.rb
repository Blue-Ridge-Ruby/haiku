class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :set_current_user

  private

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_authentication
    set_current_user
    redirect_to root_path, alert: "Please sign in first." unless Current.user
  end

  def require_admin
    require_authentication
    redirect_to root_path, alert: "Not authorized." unless Current.admin?
  end
end
