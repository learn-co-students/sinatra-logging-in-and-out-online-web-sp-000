class Helpers
  
  attr_accessor :user
  
  def self.current_user(ses)
    @user = User.find(ses[:user_id])
  end
  def self.is_logged_in?(ses)
    !!ses[:user_id]
  end

end