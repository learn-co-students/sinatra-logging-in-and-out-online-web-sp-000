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
    # binding.pry
    @user = User.find_by(username: params[:username])
    
    if @user
      session[:user_id] = @user.id
      Helpers.current_user(session)
    redirect to '/account'
    end
    erb :error
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
      # binding.pry
    #   erb :account
    # end
    # binding.pry
    @user = User.find_by_id(session[:user_id])
    # binding.pry
    erb :account
    end
    erb :error
    end

  get '/logout' do

    redirect '/'
  end


end

