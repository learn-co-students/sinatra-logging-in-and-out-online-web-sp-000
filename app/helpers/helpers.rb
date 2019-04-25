class Helpers
  def self.current_user(session)
    found = User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    if self.current_user(session) != nil
      true
    else
      false
    end
  end
end
