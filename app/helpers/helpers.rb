class Helpers
    def current_user
        @user = User.find_by(session[:user_id])
    end

    def is_logged_in?
    end
end