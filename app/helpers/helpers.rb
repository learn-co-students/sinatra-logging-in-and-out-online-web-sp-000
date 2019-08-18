class Helpers
    def self.current_user(session)
        User.all.find {|u| u.id == session[:user_id]}
    end

    def self.is_logged_in?(session)
        User.all.any? {|u| u.id == session[:user_id]}
    end
end