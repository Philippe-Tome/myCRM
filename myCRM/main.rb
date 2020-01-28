require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative 'db/shared'


also_reload 'db/shared'


get '/' do
  erb :index
end





