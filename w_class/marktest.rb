require "minitest/autorun"
require_relative "pc_seq.rb"
require_relative "pc_ran.rb"
require_relative "pc_unbeets.rb"

class Test_marker < Minitest::Test

###(((((()))((((((()))))((((((marktest))))))(((((()))(((((())))))))))###
	def test_marker
		player = Playerseq.new("x")
		assert_equal("x", player.marker)
	end 
###(((((()))((((((()))))((((((SequentialMove))))))(((((()))(((((())))))))))###
	def test_move
		player = Playerseq.new("x")
		assert_equal(1, player.move(["1","2","3","4","5","6","7","8","9"]))
	end	
###(((((()))((((((()))))(((((("Seq"))))))(((((()))(((((())))))))))###
	def test_move1
		player = Playerseq.new("x")
		assert_equal(4, player.move(["x","o","x","4","o","x","7","8","9"]))
	end	
###(((((()))((((((()))))(((((("Seq"))))))(((((()))(((((())))))))))###
		def test_move2
		player = Playerseq.new("x")
		assert_equal(1, player.move(["1","2","3","4","5","6","7","8","9"]))
	end	
###(((((()))((((((()))))(((((("Seq"))))))(((((()))(((((())))))))))###
	def test_move3
		player = Playerseq.new("o")
		assert_equal(3, player.move(["x","o","3","4","5","6","7","8","9"]))
	end	
###(((((()))((((((()))))(((((("Seq"))))))(((((()))(((((())))))))))###
	def test_move4
		player = Playerseq.new("o")
		assert_equal(9, player.move(["x","o","x","o","x","o","x","o","9"]))
	end
###(((((()))((((((()))))((((((RandomMove))))))(((((()))(((((())))))))))###

###$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$###
  def test_moveran1
    board = ["1","2","3","4","5","6","7","8","9"]
    player = Playerrand.new("x").move(board)
    assert_equal(true, [0,1,2,3,4,5,6,7,8].include?(player))
  end  
###(((((()))((((((()))))(((((("Ran"))))))(((((()))(((((())))))))))###
  def test_moveran2
    board = ["1","2","x",
             "o","x","o",
             "o","x","9"]
    player = Playerrand.new("o").move(board)
    assert_equal(true, [0,1,8].include?(player))
  end  
###$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$###

###(((((()))((((((()))))((((((UnBTBLFirstMove))))))(((((()))(((((())))))))))###
  def test_f_move_ub1
    board = ["1","2","3","4","5","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("5", player.f_move(board))
  end  
###(((((()))((((((()))))((((((UbFm))))))(((((()))(((((())))))))))###
  def test_f_move_ub2
    board = ["1","x","3","4","5","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("1", player.f_move(board))
  end  
###(((((()))((((((()))))((((((UbFm))))))(((((()))(((((())))))))))###
  def test_f_move_ub3
    board = ["x","2","3","4","5","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("5", player.f_move(board))
  end  
###(((((()))((((((()))))((((((UbFm))))))(((((()))(((((())))))))))###
  def test_f_move_ub4
    board = ["1","2","3","4","x","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("7", player.f_move(board))
  end
###(((((()))((((((()))))((((((UbFm))))))(((((()))(((((())))))))))###
  def test_f_move_ub5
    board = ["1","2","3","x","5","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("1", player.f_move(board))
  end
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###

###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
end