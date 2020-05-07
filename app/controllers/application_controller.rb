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
    # puts params
    # @user = User.find_by(username: params[:username])
    # @name = params[:username]
    # @user.save
    #   # binding.pry
    # if @user.include?(@name)
    #     session[:user_id] = @user.id
    #     # binding.pry
    #   redirect  '/account'
    # else
    #   redirect  '/error'
    # end
      redirect '/sessions/login'
  end

  get '/account' do
    erb :error
  end

  get '/logout' do
    redirect '/'
  end


end
