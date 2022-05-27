class ApplicationController < ActionController::Base

  def current_user  #管理者がログインしている状態を定義
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
