class Helpers
    
    def self.current_user(session)
        @user = User.find_by(id:session[:user_id])    
    end

    def self.is_logged_in?(session)
        # binding.pry
        if session[:user_id]
            !!self.current_user(session).id = session[:user_id]
        else 
            false
        end
    end
end