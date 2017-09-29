
require_relative "func.rb"

def run
  player = "X"
  game = "start"
  board = ["1","2","3","4","5","6","7","8","9"]
    until game == "end" do
	    p "#{board[0]}|#{board[1]}|#{board[2]}"
	    p "---"
	    p "#{board[3]}|#{board[4]}|#{board[5]}"
	    p "-|-|-"
	    p "#{board[6]}|#{board[7]}|#{board[8]}"
	    p "Pick a spot, 1-9."
	    
	    choice = gets.chomp.to_i
	        if  val_space(board,choice) == true
	            board = player_sel(board,player,choice)
	                if board_win(board,player) == true
	                    p "Player #{player} is the winner"
	                    game = "end"
	                else
	                	if djsdddsolvforxblablablav