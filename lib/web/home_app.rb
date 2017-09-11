# frozen_string_literal: true

class HomeApp < Application
  include ::Logging

  get '/' do
    haml :"home/index"
  end

  get '/countdown' do
    logger.info 'emit countdown'
    5.times { MessageSender.new.call('countdown', count: 5) }
    redirect '/home'
  end
end
