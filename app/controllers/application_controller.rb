class ApplicationController < ActionController::Base
  include Authentication

  protect_from_forgery with: :exception
  before_filter :ensure_loggedin

  protected
    def ensure_loggedin
      redirect_to login_path unless current_user
    end

    def ensure_not_loggedin
      redirect_to home_path if current_user
    end
end
