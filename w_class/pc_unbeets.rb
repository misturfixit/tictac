class Playerunbeets
  
  attr_accessor :marker 
  ###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
	def initialize(marker)
		@marker = marker
	end
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
  def win_move(board)
    @board = board
    choice = []
    p "#{board}dahells my board doooooinnnggggg????"
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
end 

###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
def win(ttt_board, marker)
  state = [
       [ttt_board[0],ttt_board[1],ttt_board[2]],
       [ttt_board[3],ttt_board[4],ttt_board[5]],
       [ttt_board[6],ttt_board[7],ttt_board[8]],
       [ttt_board[0],ttt_board[3],ttt_board[6]],
       [ttt_board[1],ttt_board[4],ttt_board[7]],
       [ttt_board[2],ttt_board[5],ttt_board[8]],
       [ttt_board[0],ttt_board[4],ttt_board[8]],
       [ttt_board[2],ttt_board[4],ttt_board[6]]
  ]
  winnums = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  choice = 10
  state.each_with_index do |arya, index|
       if arya.count(marker) == 2 && arya.count("") == 1
            win = arya.index("")
            choice = winnums[index][win]
       end
  end
  choice
end
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###
###(((((()))((((((()))))(((((())))))(((((()))(((((())))))))))###





# 		   elsif val == "o"
		  
# 		  else 
# 		  	ind << index+1
# 		 end	
# 	  end
# ind.sample    