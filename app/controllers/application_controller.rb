require_relative '../../config/environment'
require 'pry'
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
    @user = User.find_by(username:params["username"])
    if @user&.password == params["password"]
      session[:user_id] = @user.id
      redirect '/account'
    else
      status 401
      erb :error
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clears
    redirect '/'
  end


end

