class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authorized_to_modify?(gig)
        gig.user.contractor == current_user
      end

    def require_login
        redirect_to root_path unless logged_in?
    end


end
