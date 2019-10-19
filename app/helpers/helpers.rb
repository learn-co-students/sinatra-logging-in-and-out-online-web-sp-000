require 'sinatra/base'

class Helpers
  
  def self.current_user(session_hash)
    @user = User.find(session_hash[:user_id])
    @user
  end
  
  def self.is_logged_in?(session_hash)
    # self.current_user(session_hash).id == session_hash[:user_id]
    !!session_hash[:user_id]
  end
  
end
