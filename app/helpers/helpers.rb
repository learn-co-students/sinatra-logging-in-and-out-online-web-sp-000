require 'pry'
class Helpers


    def self.current_user(hash)
     @user = User.find(hash[:user_id])
    #   binding.pry
     @user
    end

    def self.is_logged_in?(hash)
        # binding.pry
        if hash[:user_id]
           return true
        end
        false
    end
end