class Helpers
  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    @user = User.find_by_id(session[:user_id])
    session != nil ? true : false
  end
end
