class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  def after_sign_in_path_for(resource)
    current_user.student? ? dashboard_path : questions_path
  end

  def percentage_lb
    percentage_lb = Leaderboard.new('percentages')
  end
end
