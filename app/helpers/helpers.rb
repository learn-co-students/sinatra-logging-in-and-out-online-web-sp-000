class Helpers
  def self.current_user(session)
    User.all.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

end
