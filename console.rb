require_relative "p_class.rb"
require_relative "board.rb"
require_relative "human.rb"
class Console

  attr_accessor :board, :player1, :player2, :current_player
  
  def  initialize(player1,player2) 
    @player1 = player1
    @player2 = player2
    @board = Board.new 
    @current_player = player1
  end  

  def print_board()
    p "#{board.board[0]}||#{board.board[1]}||#{board.board[2]}"
    p "=||=||="
    p "#{board.board[3]}||#{board.board[4]}||#{board.board[5]}"
    p "=||=||="
    p "#{board.board[6]}||#{board.board[7]}||#{board.board[8]}"
    p "#{current_player.marker} it's your turn"
  end
########################################################################
  def get_move
    current_player.move(board.board)
  end
########################################################################

  def checkval(choice)
    if  board.val_spot(board.board,choice) == true
        board.ud(current_player.marker,choice)
    else 
      p "Does Not Compute"
        get_move
      end     
  end 
########################################################################
  def player_sel
    if current_player == player1
      @current_player = player2
    else current_player == player2
      @current_player = player1
    end   
    current_player
  end 
########################################################################
########################################################################

# def rungame 
 
   
#     #
    
#               if board.win(board,player) == true
#                 p "Player #{player} wins"
#                   game = "done"
#               elsif board.f_board(board) == true
#                 p "Kitty got this one"
#                   game = "done"
#               else     
#                   @player = board.player_sel(player)
#               end    
  
# 	    end
#     end     
end
