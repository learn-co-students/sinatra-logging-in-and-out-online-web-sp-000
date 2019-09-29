class Helpers 

    session = {}

    def self.current_user(session)
        @username = User.find_by(id: session[:user_id])
        @username       
    end 

    def self.is_logged_in?(session)
        !!current_user(session)
    end
   
end

