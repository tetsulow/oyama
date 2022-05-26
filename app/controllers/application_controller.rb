class ApplicationController < ActionController::Base

  def require_sign_in
    redirect_to root_path unless current_user
  end

end
