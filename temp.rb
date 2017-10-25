# require 'pg'
# require_relative 'webconsole.rb' 
# require_relative 'dbase.rb'
# enable :sessions
#   load './local_env.rb' if File.exists?('./local_env.rb')

# ###(((((()))((((((()))))(((INIT'/')))(((((()))(((((())))))))))###
# get '/' do
#   session[:board] = Board.new
#   session[:player1] = Playerhuman.new("x") 
#   session[:current_player] = session[:player1] 
#   session[:console] = Console.new
#     # maketable()
#   erb :open
# end    
# ###(((((()))((((((()))))((((1pGAME))))(((()))(((((())))))))))###
# post '/1p_game' do

#   session[:p1_name] = params[:p1_name]
#   difc = params[:difc]
#     if     difc == "easy"
#       session[:player2] = Playerseq.new("o")
#     elsif  difc == "med"
#       session[:player2] = Playerrand.new("o")
#     else   difc == "hard"
#       session[:player2] = Playerunbeets.new("o")
#     end  
#   redirect '/gameplay'
# end
# ###(((((()))((((((()))))(((2pGAME)))))(((((()))(((((())))))))))###
# post '/humangame' do
#   # session[:board] = Board.new
#   # session[:player1] = Playerhuman.new("x")
#   session[:p1_name] = params[:p1_name]
#   session[:p2_name] = params[:p2_name]
#   # session[:current_player] = session[:player1]
#   session[:player2] = Playerhuman.new("o")
#   redirect '/gameplay'
# end
# ###(((((()))((((((()))))((((((GAMEPLAY))))))(((((()))(((((())))))))))###
#   get '/gameplay' do
#     mssg = params[:mssg] || ""
#     erb :gameboard, locals:{board: session[:board].board, mssg: mssg}
#   end  
# ###(((((()))((((((()))))((((((GAMELOOP))))))(((((()))(((((())))))))))###
# post '/gameloop' do
#   move = params[:choice]
#     # puts "#{session[:player2]}is player 2 here????????????????????????????"
#     if  session[:board].val_spot(session[:board].board, move) == true  ### checking for valid spot
#         session[:board].place_marker("x", move)   #### placing the actual marker
#     else 
#         redirect '/gameplay?mssg=invalid spot choose again'
#     end     
       
#     if  session[:board].winr(session[:board].board) || session[:board].full?   ### checking for win or full board
#       redirect '/gameover'    
#     else 
#       p  "player2 is #{session[:player2].class}????!!!!!!!!!!!!!"
#       p  "current player is#{session[:current_player]}??????!!!!!!!!!!!!!!"
#       if session[:player2].class == Playerhuman    ### checking to see if player2 is human
#         if  session[:board].val_spot(session[:board].board, move) == true  ### checking for valid spot
#             session[:board].place_marker("o", move)   #### placing the actual marker
#         end  
#       else  
#         ai =  session[:player2].move(session[:board].board)  ### AI move
#               session[:board].place_marker("o", ai)
#       end
#       if session[:current_player] == session[:player1]   ### checking current_player
#          session[:console].player_sel()   ### changing current_player
#         redirect '/gameplay'
#       else session[:current_player] == session[:player2]   ### checking current_player
#            session[:console].player_sel()   ### changing current_player
#            p  "current player is#{session[:current_player]}??????!!!!!!!!!!!!!!"
#         redirect '/gameplay'  
#       end
#     end
#     if  session[:board].winr(session[:board].board) || session[:board].full?   ### final chech for winner or tie  
#       redirect '/gameover'
#     else  
#       redirect '/gameplay'
    # end  
    # tp://localhost:4567/ -> /gameplay""
_______CURRENTPLAYER is<Playerhuman:0x0000000002f75ec0>here....___________!!!!
_______PLAYER2 is PlayerhumanHERE.....???_______________!!!!"
"_______PLAYER1 is Playerhumanhere.....???_______________!!!!"
"_______CURRENTPLAYER is<Playerhuman:0x0000000002f75ec0>here....___________!!!!""
"::1 - - [24/Oct/2017:22:34:47 -0400] "POST /gameloop HTTP/1.1" 303 - 0.0040
::1 - - [24/Oct/2017:22:34:47 Eastern Daylight Time] "POST /gameloop HTTP/1.1" 303 0
http://localhost:4567/gameplay -> /gameloop
1 - - [24/Oct/2017:22:34:47 -0400] "GET /gameplay HTTP/1.1" 200 1026 0.0040
1 - - [24/Oct/2017:22:34:47 Eastern Daylight Time] "GET /gameplay HTTP/1.1" 200 1026
http://localhost:4567/gameplay -> /gameplay
"_______CURRENTPLAYER is<Playerhuman:0x000000000356e200>here....___________!!!!
_______PLAYER2 is PlayerhumanHERE.....???_______________!!!!
_______PLAYER1 is Playerhumanhere.....???_______________!!!!
_______CURRENTPLAYER is<Playerhuman:0x000000000356e200>here....___________!!!!"
::1 - - [24/Oct/2017:22:34:56 -0400] "POST /gameloop HTTP/1.1" 303 - 0.0028
::1 - - [24/Oct/2017:22:34:56 Eastern Daylight Time] "POST /gameloop HTTP/1.1" 303 0""
http://localhost:4567/gameplay -> /gameloop
::1 - - [24/Oct/2017:22:34:56 -0400] "GET /gameplay HTTP/1.1" 200 1016 0.0060
::1 - - [24/Oct/2017:22:34:56 Eastern Daylight Time] "GET /gameplay HTTP/1.1" 200 1016
http://localhost:4567/gameplay -> /gameplay"
_______CURRENTPLAYER is<Playerhuman:0x00000000035e8b90>here....___________!!!!
_______PLAYER2 is PlayerhumanHERE.....???_______________!!!!
_______PLAYER1 is Playerhumanhere.....???_______________!!!!
_______CURRENTPLAYER is#<Playerhuman:0x00000000035e8b90>here....___________!!!!
"::1 - - [24/Oct/2017:22:35:18 -0400] "POST /gameloop HTTP/1.1" 303 - 0.0120
::1 - - [24/Oct/2017:22:35:18 Eastern Daylight Time] "POST /gameloop HTTP/1.1" 303 0
http://localhost:4567/gameplay -> /gameloop