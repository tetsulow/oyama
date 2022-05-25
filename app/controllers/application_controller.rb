class ApplicationController < ActionController::Base

  # before_action :require_sign_in
    # before_action :current_user
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def current_user?(user)
      user == current_user
    end

    def require_sign_in
        redirect_to root_path unless current_user
    end

end
