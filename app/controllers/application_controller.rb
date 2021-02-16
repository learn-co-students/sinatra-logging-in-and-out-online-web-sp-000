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
    @user = User.find_by(params[:username])
    if @user
      session_id = @user.id
      redirect to '/account'
    end
     redirect to '/login'
  end

  get '/account' do
    erb :'account'
  end

  get '/logout' do
    sessions.clear
    redirect to '/'
  end


end
