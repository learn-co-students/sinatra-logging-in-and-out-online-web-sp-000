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
    binding.pry
      @user = User.all.find {|u| u.username == params[:username]}
      session[:user_id] = @user.id
      redirect '/account'
  end

  get '/account' do
    if Helpers.is_logged_in?(session) && Helpers.current_user(session) != nil
      @user = Helpers.current_user(session).username
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

