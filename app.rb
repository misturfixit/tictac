require 'sinatra'
# require_relative 'game.rb'
require_relative 'console.rb'
require_relative 'board.rb'
require_relative 'pc_human.rb'
require_relative 'pc_seq.rb'
require_relative 'pc_ran.rb'
enable :sessions

###(((((()))((((((()))))((((((InitRoute))))))(((((()))(((((())))))))))###
get '/' do
  session[:board] = Board.new
  session[:player1] = Playerhuman.new("x") 
  
  erb :open
end    
###(((((()))((((((()))))((((GameSetup))))(((-++()))(((((())))))))))###
post '/1p_game' do
  # session[:player1] = "x"
  # ret_name = params[:plyr_nm]
  difc = params[:difc]
    if difc == "easy"
      session[:player2] = Playerseq.new("o")
    elsif  difc == "med"
      session[:player2] = Playerrand.new("o")
    else   difc == "hard"
      session[:player2] = Playerunbeets.new("o")
    end  
  redirect '/gameplay'
end
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  get '/gameplay' do
    mssg = params[:mssg] || ""
    erb :gameboard, locals:{board: session[:board].board,mssg: mssg}
  end  
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
post '/gameloop' do
  move = params[:choice]
  
  if session[:board].val_spot(session[:board].board,move) == true
    session[:board].place_marker("x",move)
  else redirect '/gameplay?mssg=invalid spot choose again'
  end   
  if session[:board].winr(session[:board].board) || session[:board].full?
    redirect '/gameover'
  else  
  ai = session[:player2].move(session[:board].board)  
  session[:board].place_marker("o",ai)
  end
  if session[:board].winr(session[:board].board) || session[:board].full?  
    redirect '/gameover'
  else  
    redirect '/gameplay'
  end  
end  
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  get '/gameover' do
    if session[:board].winr(session[:board].board) == true
      erb :winner, locals:{board: session[:board].board}
    else  
    "KittIesGAme"
    end
  end
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
