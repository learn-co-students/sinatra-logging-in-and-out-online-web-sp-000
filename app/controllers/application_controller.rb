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
     @user = User.find_by(username: params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
     
    else 
      redirect to '/error'
    end 
  end

  get '/account' do
    erb :account 
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end


end

