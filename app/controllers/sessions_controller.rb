class SessionsController < ApplicationController

#   skip_before_action :require_sign_in, only: [:login]
#   skip_before_action :current_user, only: [:login]
    def login
        if params[:session]
            @user = User.find_by(name: params[:session][:name], password: params[:session][:password])
            if @user
                session[:user_id] = @user.id
                redirect_to root_path
                # user_path(session[:user_id])
            else
                render("sessions/login")
            end
        end
    end

    def destroy
        session.delete(:user_id)
        @current_user = nil
        redirect_to root_path
    end


    private
    def session_params
        params.require(:session).permit(:name,:password)
    end

end
