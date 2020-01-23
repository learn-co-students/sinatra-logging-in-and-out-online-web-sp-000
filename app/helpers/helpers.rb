class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session[:user_id]) #Takes our user and checks to see if session id matches
 end

 def self.is_logged_in?(session)
   !!session[:user_id] #Checks to see if the session's user_id is active.
 end

  
end