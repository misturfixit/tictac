require "minitest/autorun"
require_relative "pc_seq.rb"
require_relative "pc_ran.rb"
require_relative "pc_unbt.rb"

class Test_marker < Minitest::Test

###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	def test_marker
		player = Playerseq.new("x")
		assert_equal("x", player.marker)
	end 
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	def test_move
		player = Playerseq.new("x")
		assert_equal(1, player.move(["1","2","3","4","5","6","7","8","9"]))
	end	
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	def test_move1
		player = Playerseq.new("x")
		assert_equal(4, player.move(["x","o","x","4","o","x","7","8","9"]))
	end	
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
		def test_move2
		player = Playerseq.new("x")
		assert_equal(1, player.move(["1","2","3","4","5","6","7","8","9"]))
	end	
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	def test_move3
		player = Playerseq.new("o")
		assert_equal(3, player.move(["x","o","3","4","5","6","7","8","9"]))
	end	
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	def test_move4
		player = Playerseq.new("o")
		assert_equal(9, player.move(["x","o","x","o","x","o","x","o","9"]))
	end
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def test_moveran1
    board = ["1","2","3","4","5","6","7","8","9"]
    player = Playerrand.new("x")
    assert_equal(true, player.move(board).include?(marker))
  end  
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###

###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def test_f_move_ub
    board = ["1","x","3","4","5","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("1", player.f_move(board))
  end  
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
end