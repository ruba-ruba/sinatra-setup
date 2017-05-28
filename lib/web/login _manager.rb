class LoginManager < Application
  before %r{/login|/signup} do
    # set flash message
    redirect '/' if warden.authenticated?
  end

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