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
		player = "x"
		choice = 7
		board = Board.new.ud(choice,player)
		player = "o"
		choice = 7
		#board.val_spot(7,7)
		assert_equal(true, Board.new.val_spot(board,choice))
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###

end
