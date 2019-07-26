class Helpers
  
  def self.current_user(session_hash)
    @user = User.find_by(username: params[:username], password: params[:password], balance: params[:balance])
  end

  def self.is_logged_in?(session_hash)
    !!session[:user_id]
  end
  
  
  
  
  
end