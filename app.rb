require 'sinatra'
require 'pg'
require_relative 'console.rb' 
require_relative 'dbase.rb'
enable :sessions
  load './local_env.rb' if File.exists?('./local_env.rb')
###(((((()))((((((()))))((((((INIT'/'))))))(((((()))(((((())))))))))###
get '/' do
  session[:board] = Board.new
  session[:player1] = Playerhuman.new("x") 
  # session[:player2] = session[:player2] 
    # maketable()
  erb :open
end    
###(((((()))((((((()))))((((1pGAME))))(((()))(((((())))))))))###
post '/1p_game' do
  # session[:player1] = "x"
  p_name = params[:p_name]
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
###(((((()))((((((()))))(((2pGAME)))))(((((()))(((((())))))))))###
post '/humangame' do
  # session[:board] = Board.new
  # session[:player1] = Playerhuman.new("x")
  session[:player2] = Playerhuman.new("o")
  p1_name = params[:p1_name]
  p2_name = params[:p2_name]
  redirect '/gameplay'
end
###(((((()))((((((()))))((((((GAMEPLAY))))))(((((()))(((((())))))))))###
  get '/gameplay' do
    mssg = params[:mssg] || ""

    erb :gameboard, locals:{board: session[:board].board, mssg: mssg}
  end  
###(((((()))((((((()))))((((((GAMELOOP))))))(((((()))(((((())))))))))###
  post '/gameloop' do
    move = params[:choice]

    
    if  session[:board].val_spot(session[:board].board, move) == true
        session[:board].place_marker("x", move)
      ##vvvv not sure about this below.. trying to get 2 player to work
    # elsif   session[:board].val_spot(session[:board].board, move) == true  
    #         session[:board].place_marker("o", move)
    else 
      redirect '/gameplay?mssg=invalid spot choose again'
    end   
    if  session[:board].winr(session[:board].board) || session[:board].full?
      redirect '/gameover'
    # elsif 
    #   hum = session[:player2].move(session[:board].board)  
    #         session[:board].place_marker("o", hum)
    else  
      ai =  session[:player2].move(session[:board].board)  
            session[:board].place_marker("o", ai)
    end
    if  session[:board].winr(session[:board].board) || session[:board].full?  
      redirect '/gameover'
    else  
      redirect '/gameplay'
    end  
end  
###(((((()))((((((()))))((((((GAMEOVER))))))(((((()))(((((())))))))))###
get '/gameover' do
  # time = Time.now.getutc.to_s
  # time:time
  # add_entry(data)   
  if  session[:board].winr(session[:board].board) == true
    erb :winner, locals:{board:session[:board].board}
  else  
    erb :kittie, locals:{board: session[:board].board}
  end
end
###(((((()))((((((()))))((((((SCOREBOARD))))))(((((()))(((((())))))))))###
get '/scores' do
  # list = 
  result = get_score_b(score)
  list = params[:list]
  erb :scoreboard, locals:{list:list,result:result}
end       
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
