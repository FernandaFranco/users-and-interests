require 'yaml'
require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

helpers do
  def count_interests
    interests =  []
    @info.each {|_, infos| interests << infos[:interests]}
    interests.flatten.size
  end
end

before do
  @info = Psych.load_file("users.yaml")
  @users = @info.keys
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/:name" do
  @name = params[:name]
  @others = @users.reject { |user| user == @name.to_sym}
  erb :user_page
end
