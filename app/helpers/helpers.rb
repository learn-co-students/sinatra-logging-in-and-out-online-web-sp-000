require 'pry'
class Helpers
  def self.current_user(arg)
    User.find(arg[:user_id])
  end

  def self.is_logged_in?(arg)
    !!arg[:user_id]
    #current_user(arg).id == sessions[:user_id]
  end
end