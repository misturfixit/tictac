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
    @player1 = player1
    @player2 = player2
    @current_player = player1
  
  end  
  def player_sel()
    # p "  maybe__ #{current_player}__here's the current___player_________????11!!!!!"
    if current_player == @player1
        @current_player = player2
    else current_player == @player2
        @current_player = player1
    end
    @current_player

  end
end  