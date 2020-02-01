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
    session[:username] = params[:username]
    session[:password] = params[:password]
    @user = Helpers.current_user(session[:username], session[:password])
    if @user 
      @user.id = session[:id]
      redirect '/account'
    else
      redirect '/error'
    end
  end

  get '/account' do
    erb :account
  end

  get '/error' do 
    erb :error
  end

  get '/logout' do
    session.clear
  end

end


