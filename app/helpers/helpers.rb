class Helpers
  
  def self.current_user(params) 
    @user = User.find_by(params["user_id"])
  end 
  
  def self.is_logged_in?(params)
    if params[:user_id]
      true 
    else 
      false 
    end 
  end
  
end