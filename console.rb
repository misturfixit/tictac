require_relative "pc_seq.rb"
require_relative "pc_human.rb"
require_relative "pc_ran.rb"
require_relative "pc_unbeets.rb"
require_relative "board.rb"
class Console
  
  attr_accessor :board, :player1, :player2, :marker, :current_player, :showboard
###(((((()))((((((()))))((((((INIT))))))(((((()))))))(((((())))))))))###
  def  initialize() 
    @board = Board.new 
    @player1 
    @player2 = setup_players
    @current_player
    @inactive_player
    @showboard = ["1","2","3","4","5","6","7","8","9"]
  end  
###((((((G)))(((((((A)))))((((((GameSetup))))))((((((M)))((((((E)))))))###
  def setup_players()
        p "   How Many Hoomans?:..1, 2 or 0  "
    hooms = gets.chomp.to_s
      if hooms == "1"  
        @player1 = Playerhuman.new("x")
            p  "  Choose Difficulty Level::"
            p  "  1=(easy), 2=(DeePBluE) or 3=(Garry Kasparov)"
        pl2ai = gets.chomp.to_s
          if pl2ai == "1"
              @player2 = Playerseq.new("o") 
          elsif pl2ai == "2"
              @player2 = Playerrand.new("o")
          elsif pl2ai == "3" 
              @player2 = Playerunbeets.new("o") 
          else
          p       "Does Not Compute" 
          end  
      elsif hooms == "2"
          @player1 = Playerhuman.new("x") 
          @player2 = Playerhuman.new("o")
      elsif hooms == "0"
            p "   Which AIs Would you like to see beat up one another?"
            p "   1 =(Ran_v_Ran), 2 =(Seq_v_Seq), 3 =(Ran_v_Seq),
                  4 =(Garry_v_Ran), 5 =(Garry_v_Seq), 6 =(Garry_v_Garry) "
            p 
        ai_v_ai = gets.chomp.to_s
            if ai_v_ai == "1"
              @player1 = Playerrand.new("x") 
              @player2 = Playerrand.new("o") 
            elsif ai_v_ai == "2"  
              @player1 = Playerseq.new("x") 
              @player2 = Playerseq.new("o")
            elsif ai_v_ai == "3"   
              @player1 = Playerrand.new("x") 
              @player2 = Playerseq.new("o") 
            elsif ai_v_ai == "4"   
              @player1 = Playerrand.new("x") 
              @player2 = Playerunbeets.new("o") 
            elsif ai_v_ai == "5"   
              @player1 = Playerunbeets.new("x") 
              @player2 = Playerseq.new("o") 
            elsif ai_v_ai == "6"   
              @player1 = Playerunbeets.new("x") 
              @player2 = Playerunbeets.new("o") 
            else
              p       "Does Not Compute"         
            end
        else
          p       "Does Not Compute"  
        end   
    end 
    @current_player = player1
    @inactive_player = player2  
  end  
###(((((()))((((((()))))((((((PrintBoard))))))(((((()))(((((())))))))))###
  def print_board()
    p "                                                             "
    p "                                                             "
    p "       OK #{@current_player.marker} it's your turn  "
    p "       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   "
    p "                                                             "
    p "       #{@showboard[0]}  |!| #{@showboard[1]} |!| #{@showboard[2]}  "
    p "       ===|!|===|!|===   "
    p "       #{@showboard[3]}  |!| #{@showboard[4]} |!| #{@showboard[5]}  "
    p "       ===|!|===|!|===   "
    p "       #{@showboard[6]}  |!| #{@showboard[7]} |!| #{@showboard[8]}  "
    p "                                                             "
    p "                                                             "
  end

###(((((()))((((((()))))((((((ShowBoardUpdate))))))(((((()))(((((())))))))))###
  def showbup(showboard, choice, marker)
    choice = choice.to_i
    @showboard[choice - 1] = marker
    @showboard
  end
###(((((()))((((((()))))(())((((GetMove)))(())))(((((()))(((((())))))))))###
  def get_move()
    @current_player.move(@board.board)
  end
###(((((()))((((((()))))((((((ChekVal))))))(((((()))(((((())))))))))###  
  def checkval(choice)
    if  @board.val_spot(@board.board,choice) == true
      @board.place_marker(@current_player.marker,choice)
      showbup(showboard,choice,@current_player.marker)
    else 
      p "Does Not Compute"
      get_move
    end     
  end 
###(((((()))((((((()))))((((((Player Cycle))))))(((((()))(((((())))))))))###
  def player_sel()
    if current_player == @player1	
      @inactive_player = player2	
    else current_player == @player2	
      @inactive_player = player1		
    end   		
    @current_player		
    
  end  
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###  
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
end

