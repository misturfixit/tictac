class Playerunbeets
  
  attr_accessor :marker 
  ###(((((()))((((((()))))((((((Init))))))(((((()))(((((())))))))))###
	def initialize(marker)
		@marker = marker
	end
###(((((()))((((((()))))((((((WinBlock))))))(((((()))(((((())))))))))###
###(((((()))((((((()))))((((((Win_Func))))))(((((()))(((((())))))))))###
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
            elsif index == 7 || index == 5
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
  def second_move(board)
  
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
    elsif one-n-nsix.all? {|a| board[a] == "x"}
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
  end
###(((((()))((((((()))))((((((MoveFunc))))))(((((()))(((((())))))))))###
  def move(board)
    if board.count(player1) <= 1
      f_move(board)
    elsif win_move(board) <= 9
    elsif 
      second_move(board )    
  end   
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
    ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
end 
