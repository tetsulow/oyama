class SessionsController < ApplicationController
    
    def login
        if params[:session]
            @user = User.find_by(name: params[:session][:name], password: params[:session][:password])
            if @user
                session[:user_id] = @user.id
                flash[:notice] = "ログインしました"
                redirect_to root_path
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
