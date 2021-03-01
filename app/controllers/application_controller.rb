require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

=begin
After setting session[:user_id] in post, the session hash is available
across all of the routes/controllers. First, we check to see if the attempted login
is the user and that user's password is equal to the password entered on the
index page.
=end

  post '/login' do
    #raise params.inspect
    user = User.find_by(username: params[:username])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      #binding.pry
      redirect '/account'
    end
    erb :error
  end

  get '/error' do
    erb :error
  end

=begin
  Here, we don't want anyone going directly to '/account' and seeing info,
  without being logged in. We find the user by id, and, if the id has been
  set to session[:user_id] up top in '/post', we go to the account page.
  If the @user is not found, meaning he is not logged in through session[:user_id],
  he gets sent to the error page where he is told to log in.
=end

  get '/account' do
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      erb :error
    else
    erb :account
    #binding.pry
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end

