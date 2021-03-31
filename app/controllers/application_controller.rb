class ApplicationController < ActionController::Base
    helper_method :user_signed_in?, :current_user
    def user_signed_in?
        current_user.present?
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def require_logged_user
        redirect_to new_session_path,alert: "Por favor realize o login" unless user_signed_in?
    end
end
