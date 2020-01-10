class ApplicationController < ActionController::Base
    include SessionsHelper

    def signed_in_user
      unless signed_in?
        flash[:danger] = "Please login first."
        redirect_to login_url
      end
    end

    def admin_user
      unless current_user.admin?
        flash[:danger] = "You're not authorized..."
        redirect_to root_url
      end
    end

end
