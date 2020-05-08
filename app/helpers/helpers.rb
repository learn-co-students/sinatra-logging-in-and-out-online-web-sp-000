require 'pry'
class Helpers

  def self.current_user(session)
    #  binding.pry
    @user = User.find(session[:user_id])
      # binding.pry
  end

  def self.is_logged_in?(session)
    # binding.pry
     !!self.current_user(session)
    # # if session[:user_id] == nil
    #   return true
    # end
  end

end
