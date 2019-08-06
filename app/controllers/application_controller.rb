require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    # binding.pry
    erb :index
  end

  post '/login' do
    # binding.pry
    @user = User.find_by(params)
   
    if @user
      # binding.pry
      session[:user_id] = @user.id
      # binding.pry
      redirect to "/account"
    else
      erb :"error"
    end
  end

  get '/account' do
    # binding.pry
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :"account"
    else
      erb :"error"
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end


end

