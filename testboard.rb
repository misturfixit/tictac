require "minitest/autorun"
require_relative "board.rb"
###^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^###
class Testboard < Minitest::Test
###^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^###
	def test_board
		board = Board.new
		assert_equal(["1","2","3","4","5","6","7","8","9"],board.board)
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def test_ud_board
		board = Board.new
		player = "x"
		choice = 7
		board.ud(choice,player)
		board.ud(2,"o")
		assert_equal(["1","o","3","4","5","6","x","8","9"],board.board)
	end	
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def test_ud_again
		board = Board.new
		board.board = ["1","o","3","4","5","6","x","8","9"]	
		board.ud(3,"x")
		assert_equal(["1","o","x","4","5","6","x","8","9"],board.board)
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def test_val_spot
		#player = "x"
		#choice = 7
		board = Board.new
		board.board = ["1","o","x","o","5","6","x","8","9"]
		choice = 7
		#board.val_spot(7,"x")
		assert_equal(false, board.val_spot(choice))
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def test_valspot2
		board = Board.new
		board.board = ["1","o","3","x","5","6","x","8","9"]
		choice = 5
		assert_equal(true, board.val_spot(choice))
	end	
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def test_f_board
		board = Board.new
		board.board = ["o","o","x","x","o","x","x","o","x"]
		assert_equal(true, board.f_board)
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def test_f_board1
		board = Board.new
		board.board = ["o","2","x","x","o","x","x","o","x"]
		assert_equal(false, board.f_board)
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def test_win
		board = Board.new
		board.board = ["o","o","o","x","o","x","x","o","x"]
		player = "o"
		assert_equal(true, board.winr(board,player))
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def test_win1
		board = Board.new
		board.board = ["o","x","o","x","o","x","x","o","x"]
		player = "o"
		assert_equal(false, board.winr(board,player))
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
end
