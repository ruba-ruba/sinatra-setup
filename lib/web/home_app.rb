class HomeApp < Application
  get '/' do
    haml :"home/index"
  end
end
