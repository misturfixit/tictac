require 'sinatra'
require 'pg'
require_relative 'webconsole.rb' 
require_relative 'dbase.rb'
enable :sessions
  load './local_env.rb' if File.exists?('./local_env.rb')

###(((((()))((((((()))))(((INIT'/')))(((((()))(((((())))))))))###
get '/' do
  session[:board] = Board.new
  session[:player1] = Playerhuman.new("x") 
  session[:current_player] = session[:player1] 
  session[:console] = Console.new
    # maketable()
  erb :open
end    
###(((((()))((((((()))))((((1pGAME))))(((()))(((((())))))))))###
post '/1p_game' do

  session[:p1_name] = params[:p1_name]
  difc = params[:difc]
    if     difc == "easy"
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
  session[:p1_name] = params[:p1_name]
  session[:p2_name] = params[:p2_name]
  session[:player2] = Playerhuman.new("o")
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
            # puts "#{session[:player2]}is player 2 here?_______________________???????????"
    if  session[:board].val_spot(session[:board].board, move) == true    ### checking for valid spot
        session[:board].place_marker("x", move)   #### placing the actual marker
    else 
        redirect '/gameplay?mssg=invalid spot choose again'
    end     
       
    if  session[:board].winr(session[:board].board) || session[:board].full?    ### checking for win or full board
      redirect '/gameover'    
    else 
              p  "current player is#{session[:current_player]}here....___________!!!!"
              p  "ConSoLe is #{session[:console]}here..........???_______________!!!!"
      if session[:player2].class == Playerhuman    ### checking to see if player2 is human
              p  "player2 is #{session[:player2].class}HERE.....???_______________!!!!"
              p  "player1 is #{session[:player1].class}here.....???_______________!!!!"
        if session[:current_player] == session[:player1]      ### checking current_player
          session[:console].player_sel    ### changing current_player
              p  "current player is#{session[:current_player]}here....___________!!!!"
          redirect '/gameplay'
        else session[:current_player] == session[:player2]     ### checking current_player
          session[:console].player_sel    ### changing current_player
              p  "current player is#{session[:current_player]}here....___________!!!!"
          redirect '/gameplay'  
        end
        if  session[:board].val_spot(session[:board].board, move) == true ###  player2 valid spot check
            session[:board].place_marker("o", move)   ### player2 move 
        end  
      else  
        ai =  session[:player2].move(session[:board].board)  ###   AI move
            session[:board].place_marker("o", ai)
      end
    end  

    
    if  session[:board].winr(session[:board].board) || session[:board].full?  ###final check for win or tie
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
  score = 
  result = get_scores(score)
  list = params[:list]
  erb :scoreboard, locals:{list:list,result:result}
end       
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  #   session[:current_player].player_sel
  # elsif  session[:board].val_spot(session[:board].board, move) == true
  #     session[:board].place_marker("o", move)
  #   redirect '/gameplay'
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
     # elsif 
    #   hum = session[:player2].move(session[:board].board)  
    #         session[:board].place_marker("o", hum)
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
# if session[:current_player] == session[:player1]
#   session[:current_player] = session[:player2]
# else session[:current_player] == session[:player2]
#   session[:current_player] = session[:player1]
# end

###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
# if current_player == session[:player1]
#   session[:current_player] = session[:player2]
# else current_player == session[:player2]
#     session[:current_player] = session[:player1]
# end
# elsif  session[:board].val_spot(session[:board].board, move) == true 
#    session[:board].place_marker("o", move)

    # else 
    #   redirect '/gameplay?mssg=invalid spot choose again'
    # end  
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
