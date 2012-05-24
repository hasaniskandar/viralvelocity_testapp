class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :after_inactive_sign_up_path_for, :after_sign_in_path_for, :after_sign_up_path_for

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
