
require_relative "func.rb"
 
def rungame
  player = "x"
  game = "run"
  board = ["1","2","3","4","5","6","7","8","9"]
    until game == "done" do
	    p "#{board[0]}||#{board[1]}||#{board[2]}"
	    p "-||-||-"
	    p "#{board[3]}||#{board[4]}||#{board[5]}"
	    p "-||-||-"
	    p "#{board[6]}||#{board[7]}||#{board[8]}"
	    p "Pick a spot, 1 thru 9."
	    
    choice = gets.chomp.to_i
      if  val_space(board,choice) == true
        board = updt_board(board,player,choice)
        if chikkndinner(board,player) == true
          p "Player #{player} is the winner"
              game = "done"
        elsif f_board(board) == true
          p "Kitty got this one"
              game = "done"
        else    
            player = player_sel(player)
        end    

      else val_space(board,choice) == false        
          p "can't move there"
      end 
      
    end
end 

rungame