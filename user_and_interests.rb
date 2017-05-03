require 'yaml'
require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @info = Psych.load_file("users.yaml")

  erb :users
end
