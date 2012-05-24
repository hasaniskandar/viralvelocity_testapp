class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :after_inactive_sign_up_path_for, :after_sign_in_path_for, :after_sign_up_path_for
end
