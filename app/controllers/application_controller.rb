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
    #use find_by allows me to search for attributes while the "find" method only allows finding by id. find_by will result in "nil" if nothing is found while "find" will returns ActiveRecord::RecordNotFound exception.
      @user = User.find_by(:username => params[:username])
      if @user != nil && @user.password == params[:password]
        #session[:user_id] = user.id
          #You are setting up a key :user_id in the session hash and storing the authenticated user's id user.id in it for later use
          #Key name can be anything
        session[:user_id] = @user.id
          redirect to '/account'
        end
      erb :error
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
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
