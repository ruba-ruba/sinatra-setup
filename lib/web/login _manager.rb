class LoginManager < Application
  get '/' do
    redirect '/home'
  end

  get '/login/?' do
    haml :'auth/login'
  end

  post '/login/?' do
    warden.authenticate!
    redirect '/'
  end

  get '/logout/?' do
    warden.logout
    redirect '/home'
  end

  get '/signup/?' do
    haml :'auth/signup'
  end

  post '/signup/?' do
    # this has to be done somewhat safer
    User.create(email: params['email'], password: params['password'])
  end
end