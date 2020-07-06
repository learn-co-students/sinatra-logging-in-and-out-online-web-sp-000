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
    @session = session

    if User.exists?(username: params[:username])
      @user = User.find_by(username: params[:username])
      @session[:user_id] = @user.id
      redirect to "/account"
    else
      erb :error
    end
  end

  get '/account' do
    @session = session

    if @session[:user_id] == nil
      erb :error
    else
      @user = User.find(@session[:user_id])
      erb :account
    end
  end

  get '/logout' do
    @session = session
    @session.clear
    redirect '/'
  end


end

