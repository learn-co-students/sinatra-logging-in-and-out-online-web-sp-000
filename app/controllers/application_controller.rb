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

  get '/error' do
    erb :error
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/account'
    else 
      erb :error
    end
  end

  get '/account' do
    # displays the account information if a user is logged in
    @user = User.find_by(username: params[:username], password: params[:password])
    if session[:user_id] = @user.id
      redirect '/account'
    else
      # shows the error page if user goes directly to /account
      redirect '/error'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
