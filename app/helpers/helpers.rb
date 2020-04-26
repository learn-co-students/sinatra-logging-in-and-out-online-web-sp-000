class Helpers

    def self.current_user(session_hash)
        @user = User.find(session_hash[:user_id])
    end

    def self.is_logged_in?(session_hash)
        self.current_user(session_hash)
        if session_hash[:user_id] == @user.id 
            return true
        else
            return false
        end
    end
end