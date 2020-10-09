require "pry"

class Helpers
  def self.current_user(session)
    @user = User.find(session[:user_id])
    if @user
      return @user
    end
  end

  def self.is_logged_in?(session)
    @user = User.find(session[:user_id])
    if @user
      return true
    else
      return false
    end
  end
end
