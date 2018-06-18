class Board

	attr_accessor :board, :marker, :choice
  def	initialize()
    
    # @board = ["","","","","","","","",""]
    boarsize_h = 3
		@board = Array.new((boarsize_h * boarsize_h), "")
		puts @Board
	end
###(((((()))((()))((()))(((Marker)))((())))((())))((())((())))###
  def place_marker(marker,choice)
    # p "#{choice}is this getting there??????????????"
	  @board[choice.to_i - 1] = marker
		@board
	end
###(((((()))((()))((()))(((ValidSpot)))((())))((())))((())((())))###
	def val_spot(board,marker)
    bob = marker.to_i
    choice = bob -1
    if choice > 8  || choice < 0
      false
    elsif @board[choice] == "x" || @board[choice] == "o"
      false
    else
      true
    end
  end
###(((((()))((()))((()))(((FullBoard)))((())))((())))((())((())))###
	def full?()
    if  @board.include?("")
      false
    else
      true
    end
  end
###(((((()))((()))((()))(((WinCombos)))((())))((())))((())((())))###
	def win_combos(board)
   [[@board[0],@board[1],@board[2]],
    [@board[3],@board[4],@board[5]],
    [@board[6],@board[7],@board[8]],
    [@board[0],@board[3],@board[6]],
    [@board[1],@board[4],@board[7]],
    [@board[2],@board[5],@board[8]],
    [@board[0],@board[4],@board[8]],
    [@board[2],@board[4],@board[6]]]
	end
###(((((()))((()))((()))(((WinPos)))((())))((())))((())((())))###
	def winr(board)
    win = []
    win_combos(board).each do |comb|                               ###add .board if console broken
      if comb[0] == "x" && comb[1] == "x" && comb[2] == "x"
        win << true
      elsif comb[0] == "o" && comb[1] == "o" && comb[2] == "o"
        win << true
      else
        win << false
      end
    end
     win.include?(true)
  end

end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
###(((((()))((()))((()))((()))((())))((())))((())((())))###
