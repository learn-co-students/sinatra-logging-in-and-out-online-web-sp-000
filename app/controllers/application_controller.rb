require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get('/') {erb :index}
  get('/account') {erb :account}
  get('/logout') {session.clear; redirect '/'}

  post '/login' do
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id if @user && @user.password == params[:password]
    redirect to '/account' if @user
    erb :account
  end

end
