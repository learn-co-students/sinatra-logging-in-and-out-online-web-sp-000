class Helpers
  def self.current_user(username, password)
    @user = User.all.find_by(username: username, password: password)
  end

  def self.is_logged_in?
    !!@user
  end

end
