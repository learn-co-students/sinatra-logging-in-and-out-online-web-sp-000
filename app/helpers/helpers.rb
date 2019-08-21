class Helpers
  def self.current_user(session_hash)
    @user = User.find(session_hash[:user_id])
  end

  def self.is_logged_in?(session_hash)
   @res = !!session_hash[:user_id]
   @res
  end
end
