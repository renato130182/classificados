class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create 
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            reset_session
            session[:user_id] = user.id
            redirect_to root_path, notice: translate(".welcome")
        else
            redirect_to new_session_path, alert: translate(".invalid_credentials")
        end
    end

    def destroy
        reset_session
        redirect_to new_session_path, notice: translate(".sessionfinish")
    end

end 