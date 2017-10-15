require "minitest/autorun"
require_relative "pc_seq.rb"
require_relative "pc_ran.rb"
require_relative "pc_unbeets.rb"
require_relative "console.rb"
require_relative "board.rb"


class Test_marker < Minitest::Test

###((((((1)))((((((()))))((((((marktest))))))(((((()))(((((())))))))))###
	def test_marker
		player = Playerseq.new("x")
		assert_equal("x", player.marker)
  end 
###vvvvvvvvvvvvvvvvvvvvvvvvvvv*Seq Test*vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv###  
###((((((2)))((((()))((((((((SequentialMove))))))(((((()))(((((()))))))###
	def test_move
		player = Playerseq.new("x")
		assert_equal(1, player.move(["1","2","3","4","5","6","7","8","9"]))
	end	
###((((((3)))((((((()))))(((((("Seq"))))))(((((()))(((((())))))))))###
	def test_move1
		player = Playerseq.new("x")
		assert_equal(4, player.move(["x","o","x","4","o","x","7","8","9"]))
	end	
###((((((4)))((((((()))))(((((("Seq"))))))(((((()))(((((())))))))))###
	def test_move2
		player = Playerseq.new("x")
		assert_equal(1, player.move(["1","2","3","4","5","6","7","8","9"]))
	end	
###((((((5)))((((((()))))(((((("Seq"))))))(((((()))(((((())))))))))###
	def test_move3
		player = Playerseq.new("o")
		assert_equal(3, player.move(["x","o","3","4","5","6","7","8","9"]))
	end	
###((((((6)))((((((()))))(((((("Seq"))))))(((((()))(((((())))))))))###
	def test_move4
		player = Playerseq.new("o")
		assert_equal(9, player.move(["x","o","x","o","x","o","x","o","9"]))
	end
###^^^^^^^^^^^^^^^^^^^^^^^^^*End Seq Test*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^###
###vvvvvvvvvvvvvvvvvvvvvvvvv*Ranmove Test*vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv###
###((((((7)))((((((()))))((((((Ran))))))(((((()))(((((())))))))))###
  def test_moveran1
    board = ["1","2","3","4","5","6","7","8","9"]
    player = Playerrand.new("x").move(board)
    assert_equal(true, [1,2,3,4,5,6,7,8,9].include?(player))
  end  
###((((((8)))((((((()))))((((((Ran))))))(((((()))(((((())))))))))###
  def test_moveran2
    board = ["1","2","x",
             "o","x","o",
             "o","x","9"]
    player = Playerrand.new("o").move(board)
    assert_equal(true, [1,2,9].include?(player))
  end  
###^^^^^^^^^^^^^^^^^^^^^^^^^^^*End Ranmove Test*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^###  
###vvvvvvvvvvvvvvvvvvvvvvvvvvvvUnbeat Testvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv###
###((((((9)))((((((()))))((((((UnBeat FirstMove))))))(((((()))(((((())))))))))###
  def test_f_move_ub1
    board = ["1","2","3","4","5","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("5", player.f_move(board))
  end  
###((((((10)))((((((()))))((((((UbFm))))))(((((())))(((((())))))))))###
  def test_f_move_ub2
    board = ["1","x","3","4","5","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("1", player.f_move(board))
  end  
###((((((11)))((((((()))))((((((UbFm))))))(((((()))(((((())))))))))###
  def test_f_move_ub3
    board = ["x","2","3","4","5","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("5", player.f_move(board))
  end  
###((((((12)))((((((()))))((((((UbFm))))))(((((()))(((((())))))))))###
  def test_f_move_ub4
    board = ["1","2","3","4","x","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("7", player.f_move(board))
  end
###((((((13)))((((((()))))((((((UbFm))))))(((((()))(((((())))))))))###
  def test_f_move_ub5
    board = ["1","2","3","x","5","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("1", player.f_move(board))
  end
###((((((14)))((((((()))))((((((UbFm))))))(((((()))(((((())))))))))###
  def test_f_move_ub6
    board = ["1","2","3","4","o","6","7","8","9"]
    player = Playerunbeets.new("o")
    assert_equal("7", player.f_move(board))
  end  
###^^^^^^^^^^^^^^^^^^^^^^^^^End^Fmove^Test^^^^^^^^^^^^^^^^^^^^^^^^^^###
###vvvvvvvvvvvvvvvvvvvvvvvvvvvvWin$move$Testvvvvvvvvvvvvvvvvvvvvvvvvvvvvv###
###((((((15)))((((((()))))((((((Winmove_Hrzl))))))(((((()))(((((())))))))))### 
  def test_winmove1
    board = Board.new
    player = Playerunbeets.new("o")
    board.place_marker(player.marker,1)
    board.place_marker(player.marker,3)
    assert_equal("2", player.win_move(board))
  end   
###((((((16)))((((((()))))((((((Winmove_Hrzl))))))(((((()))(((((())))))))))###
  def test_winmove2
    board = Board.new
    player = Playerunbeets.new("o")
    board.place_marker(player.marker,4)
    board.place_marker(player.marker,6)
    assert_equal("5", player.win_move(board))
  end   
###((((((17)))((((((()))))((((((Winmove_Hrzl))))))(((((()))(((((())))))))))###
  def test_winmove3
    board = Board.new
    player = Playerunbeets.new("o")
    board.place_marker(player.marker,7)
    board.place_marker(player.marker,9)
    assert_equal("8", player.win_move(board))
  end   
###((((((18)))((((((()))))((((((Winmove_Hrzl))))))(((((()))(((((())))))))))###
  def test_winmove4
    board = Board.new
    player = Playerunbeets.new("o")
    board.place_marker(player.marker,7)
    board.place_marker(player.marker,9)
    assert_equal("8", player.win_move(board))
  end   
###((((((19)))((((((()))))((((((Winmove_Vert))))))(((((()))(((((())))))))))###
  def test_winmove5
    board = Board.new
    player = Playerunbeets.new("o")
    board.place_marker(player.marker,1)
    board.place_marker(player.marker,7)
    assert_equal("4", player.win_move(board))
  end   
###((((((20)))((((((()))))((((((Winmove_Vert))))))(((((()))(((((())))))))))###
  def test_winmove6
    board = Board.new
    player = Playerunbeets.new("o")
    board.place_marker(player.marker,2)
    board.place_marker(player.marker,5)
    assert_equal("8", player.win_move(board))
  end   
###((((((21)))((((((()))))((((((Winmove_Vert))))))(((((()))(((((())))))))))###
  def test_winmove7
    board = Board.new
    player = Playerunbeets.new("o")
    board.place_marker(player.marker,3)
    board.place_marker(player.marker,6)
    assert_equal("9", player.win_move(board))
  end   
###((((((22)))((((((()))))((((((Winmove_Vert))))))(((((()))(((((())))))))))###
  def test_winmove8
    board = Board.new
    player = Playerunbeets.new("o")
    board.place_marker(player.marker,1)
    board.place_marker(player.marker,5)
    assert_equal("9", player.win_move(board))
  end   
###((((((23)))((((((()))))((((((Winmove_Vert))))))(((((()))(((((())))))))))###
  def test_winmove9
    board = Board.new
    player = Playerunbeets.new("o")
    board.place_marker(player.marker,3)
    board.place_marker(player.marker,5)
    assert_equal("7", player.win_move(board))
  end   
###^^^^^^^^^^^^^^^^^^^^^^^^^End^Winmove^Test^^^^^^^^^^^^^^^^^^^^^^^^^^###

###vvvvvvvvvvvvvvvvvvvvvvvvvvvv$SecMoveTest$vvvvvvvvvvvvvvvvvvvvvvvvvvvvv###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###

end