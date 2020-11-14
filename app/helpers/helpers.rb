class Helpers 

    
    def current_user(session) 

        User.find_by(id: session[:user_id]) 

    end
        
    
    def is_logged_in?(session) 
        !!session[:user_id]
    end

end

 #current_user should accept the session hash as an argument. 
    #This method should use the user_id from the session hash to find 
    #the user in the database and return that user.

#is_logged_in? should also accept the session hash as an argument. 
#This method should return true if the user_id is in the session hash 
#and false if not. The Ruby !! operator will come in handy here.

