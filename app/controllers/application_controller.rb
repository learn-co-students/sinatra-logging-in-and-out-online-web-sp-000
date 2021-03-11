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
    if User.all.include?(User.find_by(username: params[:username]))
      session[:user_id]=User.find_by(username: params[:username]).id
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
      @current_user=Helpers.current_user(session)
      binding.pry
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

