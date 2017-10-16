class Playerunbeets
  
  attr_accessor :marker 
###(((((()))((((((()))))((((((Init))))))(((((()))(((((())))))))))###
	def initialize(marker)
		@marker = marker
	end
###(((((()))((((((()))))((((((//Win_Func//))))))(((((()))(((((())))))))))###
  def win_move(board)
    @board = board
    choice = []
    # p "#{board}dahells my board doooooinnnggggg????"
    board.board.each_with_index do |op_spot,index|
      #p op_spot
      #p index 
      if op_spot == "#{index + 1}"
          @board.place_marker(@marker,op_spot)
        if @board.winr(@board) == true
          choice = op_spot
        end
        @board.place_marker("#{index + 1}", "#{index + 1}")     
      end
      end 
      if choice == []
        false
      else
        choice
      end     
  end  
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))((((((FirstMove))))))(((((()))(((((())))))))))###
  def f_move(board)	
    choice = []
    if board.include?("o") || board.include?("x") == true   
      board.each_with_index do |val,index|
        if	val != "#{index+1}"
          if index%2 == 1
            if index == 1 || index == 3
              choice = 0
            else index == 7 || index == 5
              choice = 8
            end     
          elsif index%2 == 0 && index != 4
            choice = 4   
          else   
            choice = 6 
          end   
        end
      end  
    else
      choice = 4     
    end
    f_move = "#{choice+1}"
    f_move
  end	
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))((((((SecMove))))))(((((()))(((((())))))))))###
  def sec_move(board)

    one-n-eight = [0,7]
    one-n-six = [0,5]
    three-n-eight = [2,7]
    three-n-four = [3,4]
    seven_-n-two = [1,6]
    seven-n-six = [5,6]
    nine-n-two = [1,8]
    nine-n-four = [3,8]
    choice = 13
  
    if one-n-eight.all? {|a| board[a] == "x"}
      choice = 6
    elsif one-n-six.all? {|a| board[a] == "x"}
      choice = 3
    elsif three-n-eight.all? {|a| board[a] == "x"}
      choice = 9
    elsif three-n-four.all? {|a| board[a] == "x"}
      choice = 1
    elsif seven-n-two.all? {|a| board[a] == "x"}
      choice = 1
    elsif seven-n-six.all? {|a| board[a] == "x"}
      choice = 3
    elsif nine-n-two.all? {|a| board[a] == "x"}
      choice = 1
    else  nine-n-four.all? {|a| board[a] == "x"}
      choice = 1
    end
     choice
  end
  ###(((((()))((((((()))))((((((MoveFunc))))))(((((()))(((((())))))))))###
  def move(board)
    if board.count(@player1) <= 1
      f_move(@board)
    elsif win_move(@board) <= 9
    elsif second_move(@board)      
    end
  end     
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
end 

###(((((()))((((((()))))((((((WinBlockFunc))))))(((((()))(((((())))))))))###  
# def win_block(board)
#   board_state = [
#   [@board[0],@board[1],@board[2]],
#   [@board[3],@board[4],@board[5]],
#   [@board[6],@board[7],@board[8]],
#   [@board[0],@board[3],@board[6]],
#   [@board[1],@board[4],@board[7]],
#   [@board[2],@board[5],@board[8]],
#   [@board[0],@board[4],@board[8]],
#   [@board[2],@board[4],@board[6]]]

#     winnums = [[0,1,2], [3,4,5], 
#       [6,7,8], [0,3,6], [1,4,7], 
#       [2,5,8], [0,4,8], [2,4,6]]
#   choice = 10
#   board_state.board.each_with_index do |vals, index|
#     if vals.count(@marker) == 2 && vals.count("") == 1
#        win = vals.index("")
#        choice = winnums[index][win]
#     end
#   end
#   choice
# end