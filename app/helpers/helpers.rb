class Helpers
  def self.current_user(session_hash)
      #User.all.find_by(username: session[:username], password: session[:password])
      User.all.find(session_hash[:user_id])
  end

  def self.is_logged_in?(session_hash)
    #!!User.all.find_by(username: session[:username], password: session[:password])
    !!User.all.find(session_hash[:user_id])
  end

end



  