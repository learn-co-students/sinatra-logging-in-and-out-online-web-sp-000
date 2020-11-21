module Helpers
    def self.current_user(session)
        current_user = session[:user_id]
        
        user = User.find_by(id: current_user)
        
        
        return user
    end

    def self.is_logged_in?(session)
        current_user = session[:user_id]
        !!current_user
    end
end