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
    #NOTE: this is post/login. not get/login.
    #there is NO get/login controller action.
    # if u tried to request get /login by dong localhost:9393/login
    #it will say Sinatra doesn’t know this ditty.
    #HOWEVER, if u enter the wrong password/username combo
    #then it will lead u to a /login page
    #and it says you must login etc... thats the error.erb view file
    #its weird like that
    #it doesnt exist yet it does

    @user = User.find_by(username: params[:username], password: params[:password])
    #this expect BOTH to be a match
    #if u include attributes that dont exist in the user, like find_by(flavor: "vanilla")
    #it will not ignore that. instead it causes an error
    

    if @user
      #we're not passing anything to any views. at least not directly
      #instead, we add the userid to the session hash, which is accessible by any other controller actions
      #so, when we redirect to get /account, get/account can use session hash to figure out the user
      #and get/account can then pass down that info to its own views
      session[:user_id] = @user.id 
      redirect '/account'
    else
      erb :error
      #this is just a viewfile named error lol
    end

  end

  get '/account' do
    #explain:
    #views naturally have access to all classes, like models, helpers etc
    #it just doesn't have access to variables, like params and needed to be passed to
    #but it seems session is naturally available... u dont need to make an @ for it
    @user = User.find_by(id: session[:user_id])

    if @user
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

