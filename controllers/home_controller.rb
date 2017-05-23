class HomeController < ApplicationController
  get '/' do
    haml :"home/index"
  end
end