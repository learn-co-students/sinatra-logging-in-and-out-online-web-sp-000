class Helpers

    def self.current_user(session_id)
        user = User.find(session_id[:user_id])
        user
    end

    def self.is_logged_in?(session_id)
        !session_id.nil?
    end

end