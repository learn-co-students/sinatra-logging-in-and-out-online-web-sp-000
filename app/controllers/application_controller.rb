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
    #binding.pry
    @user = User.find_by(:username => params[:username]) # check to make sure @user isn't nil before calling a method on it
    if @user != nil && params[:password] == @user.password
      session[:user_id] = @user.id
    redirect '/account' 
    else
    erb :error
    end
  end

  get '/account' do
    # look for a user by their session id
    # if that user exists erb :account
  @user = User.find_by_id(session[:user_id])
  if @user # if we did find a user, otherwise will return nil
    erb :account
  else
    erb :error
  end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end

