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
    if User.find_by(username: params[:username])
      @user1 = User.find_by(username: params[:username])
      session[:user_id] = @user1.id
      redirect to "/account"
    else 
      erb :error
    end 
  end

  get '/account' do
    @username = Helpers.current_user(session).username
    @balance = Helpers.current_user(session).balance.to_f
    erb :account
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

