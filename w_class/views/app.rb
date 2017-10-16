require 'sinatra'
require_relative 'game.rb'
require_relative 'console.rb'
enable :sessions


get '/' do
  session[:board] = Board.new
  session[:player] = Playerhuman.new
  session[:two] = Playerseq.new
  session[:one] = Playerrand.new
  session[:three] = Playerunbeets.new

  erb :open
end    