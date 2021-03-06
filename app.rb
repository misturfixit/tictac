require 'sinatra'
require 'pg'
require_relative 'webconsole.rb' 
require_relative 'dbase.rb'
enable :sessions
  load './local_env.rb' if File.exists?('./local_env.rb')

###(((((()))((((((()))))(((INIT'/')))(((((()))(((((())))))))))### Adding a comment to commit and test my git
  get '/' do
    session[:board] = Board.new
          # p "__________________#{session[:current_player].marker}" 
    session[:console] = Console.new
      # maketable()
    erb :open
  end    
###(((((()))((((((()))))((((1pGAME))))((((())))(((((())))))))))###
  post '/1p_game' do
    difc = params[:difc]
    difc2 = params[:difc2]
    p "______difcSELECTION____________#{difc}__________HERE___________"
    p "________difc2SELECTION__________#{difc2}____________THERE_________" 

      if  difc == "human"
        session[:player1] = Playerhuman.new("x",params[:p1_name]) 
      elsif  difc == "easy"
        session[:player1] = Playerseq.new("x",params[:p1_name])
      elsif  difc == "med"
        session[:player1] = Playerrand.new("x",params[:p1_name])
      else   
        session[:player1] = Playerunbeets.new("x",params[:p1_name])
      end
      if  difc2 == "human"
        session[:player2] = Playerhuman.new("o",params[:p2_name]) 
      elsif  difc2 == "easy"
        session[:player2] = Playerseq.new("o",params[:p2_name])
      elsif  difc2 == "med"
        session[:player2] = Playerrand.new("o",params[:p2_name])
      else  
        session[:player2] = Playerunbeets.new("o",params[:p2_name])
      end
      session[:current_player] = session[:player1]    
      
      p "_______PLAYER1#{session[:player1].class}is here________________"
      p "_______PLAYER2#{session[:player2].class}is here________________"
    redirect '/gameplay'
  end

  ###(((((()))((((((()))))((((((GAMEBOARD))))))(((((()))(((((())))))))))###
  get '/gameboard' do
    mssg = params[:mssg] || ""

    erb :gameboard, locals:{board: session[:board].board, mssg: mssg, playerturn:session[:current_player].name}
  end
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  ###(((((()))((((((()))))(((GAMEPLAY))))(((((()))(((((())))))))))###
  get '/gameplay' do
    mssg = params[:mssg] || ""
      p "________CURRENTPLAYERCLASS________________#{session[:current_player].class}______________"  
    if session[:current_player].class == Playerhuman
      redirect '/gameboard?mssg='+mssg
      else
        p "__________#{session[:current_player]}is here__________________________________"
        ai =  session[:current_player].move(session[:board].board)  ###   AI move
              session[:board].place_marker(session[:current_player].marker, ai) 
        if session[:current_player] == session[:player1]      ### checking the current_player
           session[:current_player] = session[:player2] 
        else
          session[:current_player] = session[:player1]
        end  
      end 
      if  session[:board].winr(session[:board].board) || session[:board].full?  ###final check for win or tie
        redirect '/gameover'
      else  
        redirect '/gameplay'
      end        
  end  
###(((((()))((((((()))))((((GAMELOOP))))(((((()))(((((())))))))))###
  post '/gameloop' do
    move = params[:choice]
    
      if  session[:board].val_spot(session[:board].board, move) == true    ### checking for valid spot
          session[:board].place_marker(session[:current_player].marker, move)   #### placing the actual marker
      else 
          redirect '/gameplay?mssg=invalid spot choose again'
      end        
      if  session[:board].winr(session[:board].board) || session[:board].full?    ### checking for win or tie
        redirect '/gameover'    
      else 
                # p  "________before playerchange___CURRENTPLAYER is#{session[:current_player].marker}here....___________!!!!"
                # p  "_______PLAYER2 is #{session[:player2].marker}HERE.....???_______________!!!!"
                # p  "_______PLAYER1 is #{session[:player1].marker}here.....???_______________!!!!"
        if session[:current_player].class == Playerhuman        ### checking to see if player2 is human   
          if session[:current_player] == session[:player1]      ### checking the current_player
            session[:current_player] = session[:player2]       ### changing current_player
                # p  "_______firstplayerchange____CURRENTPLAYER is#{session[:current_player].marker}here....___________!!!!"
            redirect '/gameplay'
          else session[:current_player] == session[:player2]         ### checking who is current_player
              session[:current_player] = session[:player1]   ### changing current_player
                # p  "_____secondplayerchange__CURRENTPLAYER is#{session[:current_player].marker}here....___________!!!!"
            redirect '/gameplay' 
          end  
        else
          ai =  session[:current_player].move(session[:board].board)  ###   AI move
          session[:board].place_marker(session[:current_player].marker, ai) 
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
    winner = ""
    time = Time.now    
      if  session[:board].winr(session[:board].board) == true
        winner = session[:current_player].name
            add_entry(session[:player1].name,
            session[:player2].name,
            winner,time)
        erb :winner, locals:{board:session[:board].board,winner:winner}
      else  
        winner = "KatzGame"
            add_entry(session[:player1].name,
            session[:player2].name,
            winner,time)
        erb :kittie, locals:{board: session[:board].board}
      end 
    
  end
###(((((()))((((((()))))((((((SCOREBOARD))))))(((((()))(((((())))))))))###
  get '/scores' do
    # score = 
    result = get_scores()
    # list = params[:list]
    erb :scoreboard, locals:{result:result}
  end       
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
# post '/scores' do

# end  
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
