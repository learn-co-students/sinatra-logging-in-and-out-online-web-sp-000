class Helpers
    def self.current_user(session)
        @user = User.find(session[:user_id])
        return @user
    end

    def self.is_logged_in?(session)
        !!self.current_user(session)
    end
end