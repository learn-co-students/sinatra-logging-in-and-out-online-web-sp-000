class Helpers

    # need to have class methods because we will never have instance of Helper to call on
    def self.current_user(session) # find user by session id
        @current_user = User.find(session[:user_id])
        @current_user
    end

    def self.is_logged_in?(session) #check if there is a session
        !!session[:user_id] # if the session[:user_id] is there
    end

end