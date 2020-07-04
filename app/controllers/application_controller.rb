#get/post = a working form that accepts input and sends a dynamic response.
#params object = hash that returns text a user types dynamically

require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

#contains a form for the user to log in calling index.erb in views 
  get '/' do
    erb :index
  end

#recieving post request when user hits login. Finding user based on their username
#session is users ID, redirects them to the account route (redirect to) use ERB to display the user's data on the page
#grabs users info from the params hash. Is user that is loggin in in the database? matching passwords to see.
#if there is no match, render the error page. (ERROR.ERB, html code)
  post '/login' do
    @user = User.find_by(:username => params[:username])
       if @user != nil && @user.password == params[:password]
         session[:user_id] = @user.id
         redirect to '/account'
       end
       erb :error
  end

#get request for user account. Matching the current user to the user ID.
#if the current user has an account, show the account, if not show the error page.
  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
       if @current_user
         erb :account
       else
         erb :error
       end
  end

#get request to logout and clear the session.
  get '/logout' do
    session.clear
       redirect '/'
     end
end
