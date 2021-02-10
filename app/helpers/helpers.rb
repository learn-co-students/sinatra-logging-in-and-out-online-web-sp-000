class Helpers
    def self.current_user(session)
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def self.is_logged_in?(session)
        !!session[:user_id] # if session[:user_id] has a value, than the first bang operator it changes the truth value
    end # the double bang operator essentially says, if it's truthy return truthy if it's falsey return falsey
end