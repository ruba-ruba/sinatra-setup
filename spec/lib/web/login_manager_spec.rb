require 'spec_helper'

RSpec.describe LoginManager do
  def app
    described_class
  end

  context 'when authenticated' do
    let(:user) { create(:user) }
    before { login_as user }

    context 'GET /login' do
      it 'redirect with flash' do
        get '/login'
        expect(last_response.status).to eq 302
        # add check for flash messages
      end
    end

    context 'POST /login' do
      it 'redirect with flash' do
        post '/login'
        expect(last_response.status).to eq 302
      end
    end

    context 'GET /signup' do
      it 'redirect with flash' do
        get '/signup'
        expect(last_response.status).to eq 302
      end
    end

    context 'GET /logout' do
      it 'redirect to /' do
        get '/logout'
        expect(last_response.status).to eq 302
      end
    end
  end

  context 'when not authenticated' do
    context 'GET /login' do
      it 'render' do
        get '/login'
        expect(last_response.status).to eq 200
      end
    end

    context 'POST /login' do
      it 'redirect with flash' do
        post '/login'
        expect(last_response.status).to eq 200
        expect(last_response.body).to match(/<form action='\/login'/)
      end
    end

    context 'GET /signup' do
      it 'render' do
        get '/signup'
        expect(last_response.status).to eq 200
      end
    end

    context 'GET /logout' do
      it 'redirect to /' do
        get '/logout'
        expect(last_response.status).to eq 302
      end
    end
  end


  describe '/' do
    it 'redirect to home' do
      get '/'
      expect(last_response.location).to match(/home/)
    end
  end
end
