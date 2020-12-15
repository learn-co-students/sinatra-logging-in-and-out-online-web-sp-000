#helper class is for methods that will help us add logic to our Views. 
#these methods will only be called in Views. 
class Helpers

    def self.current_user(session)
        @user = User.find_by_id(session[:user_id])
    end 



    def self.is_logged_in?(session)
        !!session[:user_id]



    end
end