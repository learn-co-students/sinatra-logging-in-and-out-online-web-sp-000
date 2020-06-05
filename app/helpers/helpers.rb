class Helpers
    def self.current_user(session)
        user = User.find_by(id: session[:user_id])
        return user
     end

    def self.is_logged_in?(session)
        session.key?(:user_id)
     end
end