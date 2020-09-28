require_relative '../../config/environment'

class Helpers


    def initialize
    end

    def self.current_user(session)
        user = User.find_by(id: session[:user_id])
    end

    def self.is_logged_in?(session)
        if User.find_by(id: session[:user_id])
            return true
        else
            return false
        end
    end

end