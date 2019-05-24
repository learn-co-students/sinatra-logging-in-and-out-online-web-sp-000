class Helpers
  def self.current_user(session)
    current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    
   
    
  end 

  def self.is_logged_in?(hash)
   !!hash[:user_id]
  
  end 
  
end