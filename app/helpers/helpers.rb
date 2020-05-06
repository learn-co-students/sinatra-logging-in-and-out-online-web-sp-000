require 'pry'
class Helpers
# binding.pry
  def self.current_user(session)
    @user = User.find_by(session[:id])
      # binding.pry
  end

  def self.is_logged_in?(session)
    # binding.pry
    if session[:id] == nil
      return true
    end
  end

end
