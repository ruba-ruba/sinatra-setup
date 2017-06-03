# frozen_string_literal: true

class LoginManager < Application
  before %r{/login|/signup} do
    if warden.authenticated?
      env['x-rack.flash'][:notice] = 'already logged in.'
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
    user = SignupProcessor.process(params)
    if user.new?
      env['x-rack.flash'][:error] = 'parameters are not valid'
      haml :'auth/signup'
    else
      warden.set_user(user)
      redirect '/'
    end
  end
end
