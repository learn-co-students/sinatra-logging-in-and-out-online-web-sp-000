class Helpers < ActiveRecord::Base
    def self.current_user(session)
        user = User.find(session[:user_id])
    end

    def self.is_logged_in?(session)
        if session[:user_id] && User.find(session[:user_id])
          return true
        end
    end

end
