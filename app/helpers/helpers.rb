class Helpers

    #warning: if it's not class methods i t wont work
    #cuz we only do Helpers.is_logged_in?
    #we dont create an instnace of Helpers class!!!
    
    def self.current_user(sessionhash)
        @userinstance = User.find_by(id: sessionhash[:user_id])
    end 

    def self.is_logged_in?(sessionhash)
        if sessionhash[:user_id]
            true
        else
            false
        end

    end



end