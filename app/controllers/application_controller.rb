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
 

    @user = User.find_by(username: params[:username],password: params[:password])

    if @user # if user is found
      session[:user_id] = @user.id
      # session[:user_id] = @user.id
      redirect to '/account'
    else
      erb :error
    end

  end

  get '/account' do
    # if user is logged in then 

    @user = User.find_by_id(session[:user_id])

    if @user #if user found => truth
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

