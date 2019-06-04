class Helpers
    def self.current_user(session_hash)
        @user = User.find(session_hash[:user_id])
    end 

    def self.is_logged_in?(session_hash)
        #true if user_id in session hash
        !!session_hash[:user_id]
    end 

end