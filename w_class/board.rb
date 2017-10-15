class Board

	attr_accessor :board, :marker, :choice
	def	initialize()
			@board = ["1","2","3","4","5","6","7","8","9"]
	end
###(((((()))((()))((()))((()))((())))((())))((())((())))###
  def place_marker(marker,choice)
    # p "#{choice}is this getting there??????????????"
	  @board[choice.to_i - 1] = marker
		@board					
	end	
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def val_spot(board,choice)
  choice = choice-1
    if choice > 8  || choice < 0
      false
    elsif @board[choice] == "x" || @board[choice] == "o"
      false
    else 
      true  
    end     
  end 
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def full?()
    if  @board.include?("1")||@board.include?("2")||
        @board.include?("3")||@board.include?("4")||
        @board.include?("5")||@board.include?("6")||
        @board.include?("7")||@board.include?("8")||
        @board.include?("9") 
      false
    else
      true
    end
  end    
###(((((()))((()))((()))((()))((())))((())))((())((())))###
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
###(((((()))((()))((()))((()))((())))((())))((())((())))###
	def winr(board)
    win = []
    win_combos(board.board).each do |comb|
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