class LoginManager < Application
  before %r{/login|/signup} do
    if warden.authenticated?
      env['x-rack.flash'][:notice] = 'You already logged in.'
      redirect '/'
    end
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
    if user = User.create(email: params['email'], password: params['password'])
      warden.set_user(user)
      redirect '/'
    end
    retirect 'signup'
  end
end
