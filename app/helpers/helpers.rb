require 'pry'
class Helpers
  def self.current_user(session)
    User.find_by(session[:id])
  end
  
  def self.is_logged_in?(session)
    if !!session[:user_id]
      true
    else
      false
    end
  end
end