require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @username = @params[:username]
    @pw = @params[:password]
    @user = User.find_by(username: @username)

    if !@user.nil? && @user.password == @pw
      session[:user_id] = @user.id
      redirect '/account'
    end
      erb :error
  end

  get '/account' do
    if session[:user_id]
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/error' do 
    erb :error
  end 

end

