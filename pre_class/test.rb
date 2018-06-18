require "minitest/autorun"
require_relative "func.rb"

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
		board = ["1","x","3","o","5","o","7","8","9"]
		choice = 7
		assert_equal(true, val_space(board,choice))
	end
############################################################################################
def test_val_space2
	 board = ["1","2","x","o","5","o","7","x","9"]
	 player = "o"
	 choice = 3
	 assert_equal(false, val_space(board,choice))
end	
############################################################################################
	def test_player_sel
		player = "x"
		assert_equal("o",player_sel(player))
	end	
############################################################################################
	def test_player_sel
		player = "o"
		assert_equal("x",player_sel(player))
	end	
############################################################################################
	def test_f_board
		board = ["x","o","x","o","x","o","x","o","x"]
		assert_equal(true, f_board(board))
	end
############################################################################################
	def test_f_board2
		board = ["x","o","x","o","x","o","7","o","9"]
    assert_equal(false, f_board(board))	
	end	
############################################################################################
	def test_f_board3
		board = ["x","o","x","o","x","o","x","o","x"]
		assert_equal(true, f_board(board))
	end 
############################################################################################
	def test_win
		board = ["x","x","x","o","x","o","7","8","o"]
		assert_equal(true, chikkndinner(board))
	end 
############################################################################################
	def test_win2
		board = ["x","2","x","o","o","o","x","8","o"]
		assert_equal(true, chikkndinner(board))
	end	
############################################################################################
	def test_anudderwin
		board = ["x","2","x",
						 "o","x","o",
						 "x","8","o"]
		assert_equal(true, chikkndinner(board))
	end	
############################################################################################
	def test_onemo_win
		board = ["x","2","o",
						 "o","o","5",
						 "o","8","o"]
		assert_equal(true, chikkndinner(board))
	end	
############################################################################################

end
