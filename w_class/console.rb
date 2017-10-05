require_relative "pc_seq.rb"
require_relative "pc_human.rb"
require_relative "pc_ran.rb"
require_relative "board.rb"
class Console
  
  attr_accessor :board, :player1, :player2, :current_player
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def  initialize(player1,player2) 
    @player1 = player1
    @player2 = player2
    @board = Board.new 
    @current_player = player1
  end  
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def plyrtype()
p "   How Many Hoomans?:..1, 2 or 0  "
hooms = gets.chomp
    if hooms == 1  
      @player1 =  Playerhuman.new("x")
p  "  Choose Difficulty Level::"
p  "  1=(easy), 2=(Hard) or 3=(Garry Kasparov)"
pl2ai = gets.chomp
      if pl2ai == 0
        @player2 = Playerseq.new("o")  
      elsif pl2ai == 1
        @player2 = Playerrand.new("o")
      else pl2ai == 2 
        @player2 = Playerunbtbl.new("o") 
      end  
    elsif hooms == 2
        @player1 == Playerhuman.new("x") && @player2 == Playerhuman.new("o")
    else hooms == 0
p "   Which AIs Would you like to see beat up one another?"
p "   1 = (ran_v_ran), 2 = (seq_v_seq) or 3 = (ran_v_seq)"
p "   "
ai_v_ai = gets.chomp
      if ai_v_ai == 0
        @player1 = Playerrand.new("x") && @player2 == Playerrand.new("o") 
      elsif ai_v_ai == 1  
        @player1 = Playerrand.new("x") && @player2 == Playerseq.new("o") 
      else ai_v_ai == 2   
        @player1 = Playerseq.new("x") && @player2 == Playerseq.new("o")
      end
    end   
  end  
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def print_board()
    p "                                                             "
    p "                                                             "
    p "       OK #{current_player.marker} it's your turn   "
    p "       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   "
    p "                                                             "
    p "       #{board.board[0]}  |!| #{board.board[1]} |!| #{board.board[2]}  "
    p "       ===|!|===|!|===   "
    p "       #{board.board[3]}  |!| #{board.board[4]} |!| #{board.board[5]}  "
    p "       ===|!|===|!|===   "
    p "       #{board.board[6]}  |!| #{board.board[7]} |!| #{board.board[8]}  "
    p "                                                             "
    p "                                                             "
  end
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def get_move
    current_player.move(board.board)
  end
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###  
  def checkval(choice)
    if  board.val_spot(board.board,choice) == true
      board.ud(current_player.marker,choice)
    else 
      p "Does Not Compute"
      get_move
    end     
  end 
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def player_sel#(player1,player2)
    if current_player == player1
      @current_player = player2
    else current_player == player2
      @current_player = player1
    end   
    current_player
  end 
  
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###	
  
  
end
