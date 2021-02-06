class Helpers
    def current_user(session)
        User.find(session[:user_id])
    end

    def is_logged_in?(session)
        if session.include?(session[:user_id])
            true
        else
            false
        end
        
    end

end