require_relative "pc_seq.rb"
require_relative "pc_human.rb"
require_relative "pc_ran.rb"
require_relative "pc_unbeets.rb"
require_relative "board.rb"
class Console
  
  attr_accessor :board, :player1, :player2, :marker, :current_player, :showboard
###(((((()))((((((()))))((((((INIT))))))(((((()))))))(((((())))))))))###
  def  initialize() 
    # @board = Board.new 
    session[:player1] = @player1 
    session[:player2] = @player2
    session[:current_player] = session[:player1]
  
  end  
  def player_sel()
    p      " MAybe  #{current_player}here's the current___player_________????11!!!!!"
    if current_player == @player1
        @current_player = player2
    else current_player == @player2
        @current_player = player1
    end
    @current_player

  end
end  