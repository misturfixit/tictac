require "minitest/autorun"
require_relative "tictac.rb"

class Testtictac < Minitest::Test

	def test_updt_board
		board = ["1","x","3","4","5","6","7","8","9"]
		player = "x"
		choice = 2
		assert_equal(["1","x","3","4","5","6","7","8","9"], updt_board(board,player,choice))
	end
############################################################################################
	def test_updt_board5
			board = ["1","2","3","4","5","6","7","8","9"]
			player = "x"
			choice = 5
			assert_equal(["1","2","3","4","x","6","7","8","9"], updt_board(board,player,choice))
	end	
############################################################################################
	def test_updt_board
	    board = ["1","2","3","4","5","6","7","8","9"]
	    player = "x"
	    choice = 6
	    assert_equal(["1","2","3","4","5","x","7","8","9"], updt_board(board,player,choice))
	end
############################################################################################
	def test_updt_board7
			board = ["1","2","3","4","5","6","7","8","9"]
			player = "x"
			choice = 7
			assert_equal(["1","2","3","4","5","6","x","8","9"], updt_board(board,player,choice))
	end	
############################################################################################
	def test_val_space
		board = ["1","2","3","4","5","6","7","8","9"]
		choice = 7
		player = "x"
		assert_equal(["1","2","3","4","5","6","x","8","9"], updt_board(board,player,choice))
	end
############################################################################################
# 	def test_player_sel
# 		player = "x"
# 		assert_equal("o",player_sel(player))
# 	end	
end
############################################################################################
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def Show_board(board)

	puts " #{board[0]} | #{board[1]} | #{board[2]} "
	puts "-------------"
	puts " #{board[3]} | #{board[4]} | #{board[5]} "
	puts "-------------"
	puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
 Show_board(board)
############################################################################################
############################################################################################
############################################################################################
############################################################################################
