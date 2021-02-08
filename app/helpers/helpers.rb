require 'pry'
class Helpers
    def self.current_user(session)
        
        user = User.find(session[:user_id])
        
        user
    end

    def self.is_logged_in?(session)
     
        if current_user(session).id == session[:user_id]
            true
        end
        
    end

end