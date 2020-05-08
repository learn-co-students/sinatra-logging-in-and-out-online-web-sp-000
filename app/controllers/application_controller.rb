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
    @user = User.find_by(username: params[:username])
    if @user != nil && @user.password.match(params[:password])
        session[:user_id] = @user.id
      redirect '/account'
    end
    erb :error
  end

  get '/account' do
    @user = User.find_by(params[:username])
    #  binding.pry
    # !@user.username.match(params[:username])
      if !@user.password.match(params[:password])
        # redirect '/error'
    erb :error
    end
  end

  get '/error' do
    erb :error
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
