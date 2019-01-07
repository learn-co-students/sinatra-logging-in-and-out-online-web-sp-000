class Helpers

  def self.current_user(user_session)
    @current_user = User.find(user_session[:user_id])
    @current_user
  end

  def self.is_logged_in?(user_session)
    !!user_session.include?(:user_id)
  end
end
