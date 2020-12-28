require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do

    @session = session

    erb :index
  end

  post '/login' do
    is_valid_username = false
    User.all.each do |user|
      if user.username == params[:username]
        is_valid_username = true 
      end 
    end
    if is_valid_username
      user = User.find_by({:username => params[:username]})
      session[:user_id] = user.id
      redirect '/account'

    else
      session[:user_id] = nil
      erb :error
    end

  end

  get '/account' do
    @session = session

    if (Helpers.is_logged_in?(session))
      erb :account
    else 
      erb :error
    end
  end

  get '/logout' do
    session[:user_id] = nil
    @session = session

    redirect '/'
  end


end

