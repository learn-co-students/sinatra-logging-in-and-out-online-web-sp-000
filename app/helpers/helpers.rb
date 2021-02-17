class Helpers
    def self.current_user(session) # sets a variabl'e value, if it's value is nil or false in Ruby.
        @current_user ||= User.find_by_id(session[:user_id]) # behavels like a || a = b
    end

    def self.is_logged_in?(session)
        !!session[:user_id] # if session[:user_id] has a value, than the first bang operator changes the truthy value
    end # the double bang operator essentially says, if it's truthy return truthy if it's falsey return falsey
end