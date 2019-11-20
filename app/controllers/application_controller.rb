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

  #finds user in db based on username. if match redirect to /account. no match - error.
  post '/login' do
    @user = User.find_by(username: params[:username])
    
    if @user
      session[:user_id] = @user.id
      redirect to '/account'
    else
      erb :error
    end
  end

  #matches user_id to username. if match rout to account. 
  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

