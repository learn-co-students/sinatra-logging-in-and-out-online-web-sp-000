class Helpers
    def self.current_user(arg)
        @user = User.find_by(id: arg[:user_id])
        # binding.pry
    end

    def self.is_logged_in?(arg)
        # binding.pry
        !!arg[:user_id]
    end
end