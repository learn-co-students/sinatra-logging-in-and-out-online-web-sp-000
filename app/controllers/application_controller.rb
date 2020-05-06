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
    @username = User.new(params[:username])
    @user = params
      # binding.pry
    if @user.include?(@username)

    # @user = User.find(session[:username])
        session[:user_id] = @user.id
        @user.save
      redirect  '/account'
    else
      redirect  '/error'
    end
      # redirect '/sessions/login'
  end

  get '/account' do

  end

  get '/logout' do

  end


end
