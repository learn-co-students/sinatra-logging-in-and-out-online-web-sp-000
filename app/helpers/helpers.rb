class Helpers
    def current_user 
        @user = User.all.find{|u| u.username = params[:username]}
    end
end