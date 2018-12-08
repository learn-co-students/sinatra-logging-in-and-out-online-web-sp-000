class Helpers

  def self.current_user(session)
    User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    binding.pry
    if session[:user_id]
      true
    end
    false
  end

end
