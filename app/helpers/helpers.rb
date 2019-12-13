class Helpers



  def current_user(session_hash)
    session[:user_id] = @user.id
    if session_hash = @user.id 
      return @user.id 
    end 
    
    
  end 


  def is_logged_in?(session_hash)
    !!session_hash[user_id]
  end 







end