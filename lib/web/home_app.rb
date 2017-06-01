# frozen_string_literal: true

class HomeApp < Application
  get '/' do
    haml :"home/index"
  end
end
