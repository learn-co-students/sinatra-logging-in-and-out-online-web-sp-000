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
    User.all.find do |user|
      if user.username == params[:username] && user.password == params[:password]
        session[:user_id] = user.id
        redirect to '/account'
      end
    end
    erb :error
  end

  get '/account' do
    @current_user = Helpers.current_user(session)
    @current_user ? erb(:account) : erb(:error) 
  end

  get '/logout' do
    session.clear
    redirect to "/"
  end


end

