require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
  
    # puts params
    erb :index
  end

  post '/login' do
    #raise params[:username].inspect
    #binding.pry
   
    @user = User.find_by(username: params[:username])
    if @user 
      session[:user_id] = @user.id 
      redirect to '/account'
    else 
      erb :error 
    end 
  end

  get '/account' do
    # @user = User.new 
    # @user.username = params[:username]
    # @user.balance = params[:balance]
    # @user.save 
    
    erb :account 
  end

  get '/logout' do
    
  end


end

