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
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :error
    #find user in database by name
    #if match, set session id to user id, redirect to /accoount
    #if no match, error page
  end

  get '/account' do
    @user = User.find_by_id(session[:user_id])
    #can't use find_by params here because it's new page, no params have been defined here
    erb :account
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end

